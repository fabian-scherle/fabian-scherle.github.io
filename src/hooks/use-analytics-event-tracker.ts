import { logEvent } from "firebase/analytics";
import { firebaseAnalytics } from "../config/firebase";

export const useAnalyticsEventTracker = (category: string) => {
    const eventTracker = (action: string, label: string) => {
        logEvent(firebaseAnalytics, category, {
            action: action,
            label: label,
        });
    }
    return eventTracker;
}