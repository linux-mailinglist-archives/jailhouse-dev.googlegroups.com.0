Return-Path: <jailhouse-dev+bncBCP6VGWA6QARBF77XW2AMGQEPU3FZUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932492E047
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2024 08:45:46 +0200 (CEST)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-65be82a3241sf9467877b3.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720680344; x=1721285144; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGZ8Qm4bfBhVoRNLB9yifXsXrsWzes3D1GF2iaROaMc=;
        b=HMIXB6bMU/vuq4VYYTBolsLiK0gwlWu65N0DF3b+RhOHryOSwYkFzTCua7SPNyziau
         BVFP25dVq7v+ynoDzveGcQjEg/UerqJI0EzqjOO7T2hset/LTitrOvVrt+3lA38Z9abe
         /gk5LFmXcPD9vYoxJP+DdGW2Jqc+T3KsLXhBWB2TptcY2hrTiQ33Quwlb0f1VjgpaRHH
         T8jS81g9nApqfn6XBN7lqWn9bAxQWAPblPxpj9q9XqQmjdgzegV2X5AQCFi18MLjgNIL
         RprUp2EdpOG6U1vZp0ImmAtrrvTT+dsQB/42pZrIcU7Au8Qe7Gfsb/KfnYtTaYhFRSfH
         iKyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720680344; x=1721285144; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGZ8Qm4bfBhVoRNLB9yifXsXrsWzes3D1GF2iaROaMc=;
        b=MjzWhETcLVd5fzytuWAoePdz6Lhy8jmj7Xsj05ZzT1CW+7xhN4o1lke79axyLVKBNc
         8hG/Eft9g6dGJzdmtJ53FyW2NeOthLHUelIvDKogZtdf/xcLV0RwGFdK4uLTzEX1qlA8
         WmOpcjtnOOfTk6Ec7kmToG1cTWB8IYe6bl1qri28xLEyHTElvLd/PK0+mkID/gIAIAGz
         3+bkQYQhgzX0D2PL69kopPMwsGA2BngR8MHrKFCiX7Mn+5QE4ugG3eNeOLI09XlUhNTA
         zi2jdYMBM5O40B53yOod7OKhYB8XsBHgxRypWMJXKL/9ySXdjInjkIkAALQ3PA+vllbH
         uAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720680344; x=1721285144;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGZ8Qm4bfBhVoRNLB9yifXsXrsWzes3D1GF2iaROaMc=;
        b=PSpEEzL8LMXJ0k99UGy4H6dvPnT8UrkUe9UWLweUvLtJZjcY8qhKc6HP0yp0m92hPF
         oWFONQKx5mFBIrHFfYcc/VAAdOn7S3zpc0/RTrLX1kbV77hXCZxTquPHhr6vmY1wgGsu
         JEiSxrn8dRk5aerZ3fuG3f9RI4Xf2CqOhGhClJpA3xu+PI1qhQ56vjtymZM17NadbFRC
         JbfzpjgI6NkVI39QSQx2UO8AG4BgzeioOeiCkRzpvgVVxHuZ5aBXW53JmurfaLaa3OQr
         bCc43++HtfGwdMEYFA0Bs2Mk9q/Ehy5XL7BqfSSIkxM92wnyKPEvS/f0hciWXhbQlH4b
         uMRQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWSKPyV4fYY2Qhvo5GcXKJZOluAM7HIrNyfovFM9Sh+NhcN6E4nPRyvwksnFUhfuCM9p0Poib9npDv4JYRv8iVqTldfc1xBHzNe9WA=
X-Gm-Message-State: AOJu0YyRVknnx49tWuRqPslqTg6K9gjgeWdl/IgI5toldpQFapbpI4O7
	upOjLW+WtuDVlObJF07KrLNWxfybAF4qHquQ88TXa+QMi/WjOjjt
X-Google-Smtp-Source: AGHT+IG/TxYrf3pTDMnL/MvTI86et/xlTnCYEHmSftQ92WoY9mH+8ATGR1wrC6Lmq4Yo4P6/AWAnhQ==
X-Received: by 2002:a25:ab32:0:b0:e03:af3d:d4d5 with SMTP id 3f1490d57ef6-e041b22a2bbmr9343017276.56.1720680344502;
        Wed, 10 Jul 2024 23:45:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:703:b0:e03:64a5:8bb0 with SMTP id
 3f1490d57ef6-e0579032bd5ls663359276.1.-pod-prod-00-us; Wed, 10 Jul 2024
 23:45:43 -0700 (PDT)
X-Received: by 2002:a05:6902:2309:b0:e05:6532:aa4b with SMTP id 3f1490d57ef6-e05780396ccmr100548276.2.1720680342770;
        Wed, 10 Jul 2024 23:45:42 -0700 (PDT)
Date: Wed, 10 Jul 2024 23:45:42 -0700 (PDT)
From: plug house <jamesmelon009@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a9df6281-8035-4ff3-9cc0-0abb8eb2d8dan@googlegroups.com>
Subject: Hackers for Hire
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_80112_633380526.1720680342049"
X-Original-Sender: jamesmelon009@gmail.com
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

------=_Part_80112_633380526.1720680342049
Content-Type: multipart/alternative; 
	boundary="----=_Part_80113_1400777589.1720680342049"

------=_Part_80113_1400777589.1720680342049
Content-Type: text/plain; charset="UTF-8"

Hackers for Hire at https://hackersconnect.io/

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a9df6281-8035-4ff3-9cc0-0abb8eb2d8dan%40googlegroups.com.

------=_Part_80113_1400777589.1720680342049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hackers for Hire at=C2=A0https://hackersconnect.io/<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a9df6281-8035-4ff3-9cc0-0abb8eb2d8dan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a9df6281-8035-4ff3-9cc0-0abb8eb2d8dan%40googlegroups.co=
m</a>.<br />

------=_Part_80113_1400777589.1720680342049--

------=_Part_80112_633380526.1720680342049--
