package org.springframework.samples.petclinic.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.time.LocalDate;

import org.springframework.samples.petclinic.model.Book;
import org.springframework.samples.petclinic.service.exceptions.OverlappingBooksException;

public class BookValidator {

    private BookValidator(){
        new BookValidator();
    }

    public static void bookIsOccupied(Book book, Collection<Book> bookings) throws OverlappingBooksException {

        LocalDate start=book.getStartDate();
        LocalDate end=book.getEndDate();

		List<Book> petBookings= new ArrayList<>();

		petBookings.addAll(bookings);


		for(int i = 0; i < bookings.size();i++) {

			LocalDate oldStart = petBookings.get(i).getStartDate();
			LocalDate oldEnd = petBookings.get(i).getEndDate();

			boolean midAfterRange=start.isBefore(oldEnd) && end.isAfter(oldEnd);
			boolean preMidRange=start.isAfter(oldStart) && start.isBefore(oldEnd);
			boolean inRange=end.isAfter(oldStart) && end.isBefore(oldEnd);
			boolean endExactRange=start.isBefore(oldStart) && end.isEqual(oldEnd);
			boolean preExactRange=start.isEqual(oldStart) && end.isEqual(oldEnd);

			if(midAfterRange || inRange|| preMidRange|| endExactRange || preExactRange){
                throw new OverlappingBooksException();
			}
		}
	}
}