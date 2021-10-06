Return-Path: <jailhouse-dev+bncBC653PXTYYERBTMS62FAMGQEGFU2LQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378A423CD7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Oct 2021 13:32:31 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id e5-20020ac84905000000b002a69dc43859sf2020789qtq.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Oct 2021 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5ljeaiYpqQTs9HztbIIEK4l0APXNfSKk9vdpXVASNRE=;
        b=S+hHW+HOlLk6HXVNt8cc2/Nzco+quK50eeVL/AleM3cQ0xCYfHy6cV4fH6uVqypmV5
         ete5Ta3XwVGAwMwcJrpXvP/5m2p6eb1n5ywsma7jHAlj4v7yrTd0lVcKzoGPcOFEbgmM
         Xk8nmZm7FtGPr8CgmcR4FWcasR5iIqxxulCELBiWkV9WiutuJhitW5f5FXmnwQWagTZJ
         dZcLJH+qlsRfrHX+Ov2S/L5K4EwWzAmiFHvBpWeDGecxLMF0S6708nxiNSvFytZOpwaO
         eG4NAGqEQXzZ9ii6AuhoWvKVWV5Mi8e4gDZluotMCAR7WniBwpSQMMRkyKh9eIcdO2Ge
         BAYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ljeaiYpqQTs9HztbIIEK4l0APXNfSKk9vdpXVASNRE=;
        b=hTIamIIMU3odYridKtmpxe7d+ml86ntCtfEd3N4prW3jpfK0hgYMdbruOtUGx0tN8s
         tKrdeC230X+UoTNzk7JniNXtrY/gSI2t0Ipr3bUbWAQjZCKhTWj2NUVHfykvWP1AlTuk
         CqxH+4MO2Zs4uI4fZbbgkobVrTZtHZ7mUS6VOaE167s/jJHlVv7eDLYq2mxKxFMhq5K5
         KxQTOKPzaopOEM9yljfaTCKtc//Zlxnm9nQvlILsydByVOWBW7HMahaII2rFNoVmoONO
         BwknMXkP3vRz05tihJeDwTe0e1pBwYJ6TJDMoTCEyj0fhYwG+OnKUtsHh+NlXqJdjz6t
         BOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ljeaiYpqQTs9HztbIIEK4l0APXNfSKk9vdpXVASNRE=;
        b=it0yeQaYiv5N/Rw+pzQQ5yRZb2Gk8rjrAeQ7K48o71zm1cAsRf6PPLV0PDSlBOL5SY
         Nf9kNFABLBIST/CSBhBpekA9Ephh5LrZ3+supWmkKB9vgcGQcBgOUHng2M/hvYbD1sB0
         XZg2mtQr1VdymhykhIezJWAQMol3IFb32FDSwqe872F/yhMuUkeVSOOIe/sBRMGgNX3m
         GIsxILBPOpjOLXWKRXTXPXrn9hVIvv3c44C25rDQN48PTUe4ZsBfGprAiE+3b3KERsTh
         NBpMwLRtMkvfOmKFs0Dht9I6Z5zgPKlec3nI8NEvDm+XvQhqrODxES1UmiQZQQaH8jmr
         61zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531k/dZYFkzjs8gGP8V8WANObPW0oqsJGsNIrLY9/DYCXRf8tsG5
	96mdSkL1SEF69ijqfKVadDg=
X-Google-Smtp-Source: ABdhPJwlzRsm7g9GBTEzY9rNp4zc92gV0HFkx4sZGh+62X2MO0fo2iuAFAt/LZjN9a5sLqCiEBPtAw==
X-Received: by 2002:a0c:9d05:: with SMTP id m5mr32367347qvf.30.1633519950089;
        Wed, 06 Oct 2021 04:32:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:40d0:: with SMTP id f16ls14253826qtm.1.gmail; Wed, 06
 Oct 2021 04:32:29 -0700 (PDT)
X-Received: by 2002:ac8:614b:: with SMTP id d11mr23283727qtm.396.1633519949368;
        Wed, 06 Oct 2021 04:32:29 -0700 (PDT)
Date: Wed, 6 Oct 2021 04:32:28 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <84ad6258-709d-48cc-b3f2-38d0cc95057cn@googlegroups.com>
Subject: Jailhouse Security
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1700_349419074.1633519948781"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_1700_349419074.1633519948781
Content-Type: multipart/alternative; 
	boundary="----=_Part_1701_177444846.1633519948781"

------=_Part_1701_177444846.1633519948781
Content-Type: text/plain; charset="UTF-8"

I have a question regarding security at  the root-cell.
The use case is shutting down the root cell, which definitely will shut 
other cells down. I understand that it is possible, to disable these 
commands, but is there any other possible approach?
Is there any special security constraints, that Jailhouse user has to 
consider.

Thanks in Advance
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84ad6258-709d-48cc-b3f2-38d0cc95057cn%40googlegroups.com.

------=_Part_1701_177444846.1633519948781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a question regarding security at&nbsp; the root-cell.<br>The use cas=
e is shutting down the root cell, which definitely will shut other cells do=
wn. I understand that it is possible, to disable these commands, but is the=
re any other possible approach?<br>Is there any special security constraint=
s, that Jailhouse user has to consider.<br><br>Thanks in Advance<br>Moustaf=
a Noufale<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/84ad6258-709d-48cc-b3f2-38d0cc95057cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/84ad6258-709d-48cc-b3f2-38d0cc95057cn%40googlegroups.co=
m</a>.<br />

------=_Part_1701_177444846.1633519948781--

------=_Part_1700_349419074.1633519948781--
