import { getAnalytics } from "@firebase/analytics";
import { FirebaseOptions, initializeApp } from "@firebase/app";

const firebaseConfig: FirebaseOptions = {
  apiKey: import.meta.env.VITE_FIREBASE_API_KEY!,
  authDomain: import.meta.env.VITE_FIREBASE_AUTH_DOMAIN!,
  projectId: import.meta.env.VITE_FIREBASE_PROJECT_ID!,
  storageBucket: import.meta.env.VITE_FIREBASE_STORAGE_BUCKET!,
  messagingSenderId: import.meta.env.VITE_FIREBASE_SENDER_ID!,
  appId: import.meta.env.VITE_FIREBASE_APP_ID!,
  measurementId: import.meta.env.VITE_FIREBASE_MEASUREMENT_ID!,
};

// Initialize Firebase
export const firebaseApp = initializeApp(firebaseConfig);

// `getAnalytics` requires browser globals (window, document). During the
// build-time prerender step this module runs under Node, so guard it to keep
// SSR/prerendering from crashing. Analytics is only ever used on user clicks.
export const firebaseAnalytics =
  typeof window !== "undefined"
    ? getAnalytics(firebaseApp)
    : (undefined as unknown as ReturnType<typeof getAnalytics>);
