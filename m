Return-Path: <jailhouse-dev+bncBCQ7HUU4XULBBLMNVHXQKGQEZVS7FFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id CB738115033
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Dec 2019 13:16:47 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id t10sf3621708otc.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Dec 2019 04:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lRqCzQWusGRZJ3RqBnIkzBDXUtlrIdqX4+5B9ZN45KM=;
        b=RthdFpdkeH9r7Kh9BJZSoMOhCuYwoawRMiPDuOXC1a0hmELB1St4RT2sHAMU16V4kx
         b9bOivXV3nwoc+dBm+A2GDrPf5K/Txl9YQm7NDobM8dcs+O8bENWXbYQB1QEPMsA73H5
         zMD2vwjWS/ZFGmrWOYgWTcMDlxLMUJJaMiKLFQCMNOR+sHdUXVKLSheEcdy788oDmGa6
         q12OHV/oEtJ4HWjDdUTZSblF7ajjNy0nvaFiQXmiljeVTh9Jbx0XwvvcZco7G+50UkHi
         pvXEV4rOIlfnY3fzypGd/b+RhF1iG4/B9i0Nk7wO0NYj/bkajDNle1ofAxUczbgdDffg
         Kh4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lRqCzQWusGRZJ3RqBnIkzBDXUtlrIdqX4+5B9ZN45KM=;
        b=Whe+muQRqU/UcQqrn5lpBlo3TVsBPYLrBhhMoGtuE0RZEPgKxZbonfTKfOmsR6sPHr
         ObAPimE2M2YO7inljwUS25wTmjR1vJeG7jJog5bXX/XOhTk494sd/dr1jrXLyqSJVNMk
         yrYN8owcQ5XwB0UgQn7kx8maCgkDKwCFenVrWL64P4cIhsyKj02ehalSa1mvOieuZjcO
         WZb+KXYzT5yR2AYD4TG9F26+vdVLmKWAZlBFBDluYx54rRSeNbVwtM3xFtPAOrCjTGHz
         PFJvXub3+y62LcAI8Rgbslun0NctagvOYavGZJHSFf4PNErcBWLiIlaPxFkeD/qlCDh4
         sAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lRqCzQWusGRZJ3RqBnIkzBDXUtlrIdqX4+5B9ZN45KM=;
        b=lYNi5GXvM3O7hErrpxmYKULV+Qoy/1vhyXCb/VOzCPy0o3frTHw59kP9gU3Nru6fh2
         vRoqW5hBqPAKCVzkR7YU/s4vwDgPmgPAGBsCDWHu8IDcwtZGCVZRmUvXzIpiaLU/p1AL
         RASLga5PprR1nfOH5xuzR+acZ9UhoEkGj4Q5hz4iBGEDItOBMrVNifZJBG8WCQwH6jFc
         zZz/L/2ouhb4Ulj89npMlg3Wkll1RlqQfwiaPHUjO8o1K2LCA+t+QKq4Ek8VCBf8JFn4
         pkJQsLBhOyBFCd3IXO+zQ+f57bjaJCwWc1MB6hD0gLeshgfQiO38jSOEsjpw7lGQMv4b
         7Zdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWr6TGotbkCNLYsA1yqaabGvqtFNuYVE2isXa+FkCmyRmYnEUId
	pa52ks9Rky4rSak6zRzOwNY=
X-Google-Smtp-Source: APXvYqzqWDmX1LXmllN0Z24JfHHaaMcZ9J//NJU2/EWUjeJSzvDkKTB7Tm3PQv4DbdJ7AjVw034yrQ==
X-Received: by 2002:a9d:6e8a:: with SMTP id a10mr375247otr.181.1575634606247;
        Fri, 06 Dec 2019 04:16:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:784:: with SMTP id 126ls1237795oih.8.gmail; Fri, 06 Dec
 2019 04:16:45 -0800 (PST)
X-Received: by 2002:aca:4e90:: with SMTP id c138mr12006884oib.147.1575634605556;
        Fri, 06 Dec 2019 04:16:45 -0800 (PST)
Date: Fri, 6 Dec 2019 04:16:44 -0800 (PST)
From: Saroj Sapkota <samirroj2016@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3374d7a8-6d73-4d2d-bbee-87284dafd217@googlegroups.com>
Subject: How to obtain two console in order to control hypervisor smoothly
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2635_1388941195.1575634604810"
X-Original-Sender: samirroj2016@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_2635_1388941195.1575634604810
Content-Type: multipart/alternative; 
	boundary="----=_Part_2636_825698481.1575634604810"

------=_Part_2636_825698481.1575634604810
Content-Type: text/plain; charset="UTF-8"

In the Bootstrapping Demo I can see that in the Qemu-Kvm mode there are two 
console one for displaying output and for controlling. I tried really hard 
to do the same how can I get two console, so that I can control the 
hypervisor easily.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3374d7a8-6d73-4d2d-bbee-87284dafd217%40googlegroups.com.

------=_Part_2636_825698481.1575634604810
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the Bootstrapping Demo I can see that in the Qemu-Kvm m=
ode there are two console one for displaying output and for controlling. I =
tried really hard to do the same how can I get two console, so that I can c=
ontrol the hypervisor easily.<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3374d7a8-6d73-4d2d-bbee-87284dafd217%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/3374d7a8-6d73-4d2d-bbee-87284dafd217%40googlegroups.com<=
/a>.<br />

------=_Part_2636_825698481.1575634604810--

------=_Part_2635_1388941195.1575634604810--
