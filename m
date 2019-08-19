Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRB4NN5LVAKGQEL5CUVSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA392380
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 14:32:51 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id 100sf2166150oty.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Au1B7qhVKQjDgAGSvssGiPgPyHVgiMlLfg7N1QVX58w=;
        b=mdH+/xerwr62aT+e0ZlTFKEL1Md34Wvatzap0QBgheRLTI3n1WGMdldxY8gLolZFaa
         mK2ctftUT8bq9/KNaIs9q4OlcKvqJD7jYKoLTN0Yg7W3jYsvvlf7SzT+qUsMa1MMQoqP
         yrsYFNtnntzGyQdpzzPelv/FV70F+1rwxm4yGeI94luMrRBhQ0/QokBDNjmc8E0OGeOZ
         LhuQymjibmjobLmsNbtEOSvLSUqt8c8UWOzUg4KVrqvMjKfuZGU8YAAEoWFzbmxSzBnr
         fn3PaP9+GD9lU0LcU8BrQOxlUhM8JC4Yp4IjUxAiMTNufEkllrheGksEbO0jpj7KKI0D
         AbtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Au1B7qhVKQjDgAGSvssGiPgPyHVgiMlLfg7N1QVX58w=;
        b=BPdZwzpCwZyJZPVQ5lfIGpJPXiYa67C5q4I7pP6oPNR1zeS+go2qVtHLOmWjCvhPUs
         H+Cnkz2V0eaIdFFljaBV08BipDdpllzaBC4UkCmTMsQrxKIFItW5FNS/1drA2UBi5lcg
         eYSk9I210VjtSthjYYEJEUGZSjzKzifN5q1j9woyS/FjRhogBIuyYmwRN1mtreGKyulm
         dHeD4DsBkACdDdsDa4TBMLpsXAi0SYGSdH60rNU8+R+ljoQp7bRX8tfZnqxdH7idhLR1
         dGUb9HwWIYIk4UFu0XpoBhdnJZz7ZAWG77mdPFiLXLOSN60e1E/VKIcjaoLmr+aNle8H
         VIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Au1B7qhVKQjDgAGSvssGiPgPyHVgiMlLfg7N1QVX58w=;
        b=WXjKyE02VxpVwGuL7xoBjaqbDMcsKUFtsLIKGRiJOGnalQcR6qCDG5NhiLgYpIIGFp
         fZRoXXKNzq1zz6PRez49m1G1c9Au3qs2+5p/OTjbRgRUAhUnF5ETRq/CpHnpfg7oOjLY
         6dd4RKoAHbwz2t1nwnI/J1TbMMmCA9p9qq5olz30/LacdZLxeJwqFsdaUlyVW5Faud0K
         4y4wCmbU8lVN0wYgGfWiGBa7qR7o4+dzVJX3uN1NtBrp9H/SRjn/BiOar8g6kft7xoMf
         9aU0sPTIAjPBsMUEk/KDYZpWBo4n4Tch45nsCrGhUUK8hhYD129BMcNGwnHsipP1Bpba
         IbTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXcqgfz4Rtl8SizXoaZCl6WFivt9Oq+K93EEqyv+LQZuTIh9SF4
	h4WcStAtgKRT5MsFaNRp9ac=
X-Google-Smtp-Source: APXvYqzgnVh5gZIbeGCORMY2flenRr32VStldapbGTgyA1zq8ObvA2v141QxM5ZQ2pS0ztkYPeJKGA==
X-Received: by 2002:a9d:77c4:: with SMTP id w4mr18461015otl.40.1566217970194;
        Mon, 19 Aug 2019 05:32:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:36c:: with SMTP id 99ls2984171otv.3.gmail; Mon, 19 Aug
 2019 05:32:49 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr11140613oth.150.1566217969037;
        Mon, 19 Aug 2019 05:32:49 -0700 (PDT)
Date: Mon, 19 Aug 2019 05:32:48 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <18334f63-04e4-4d66-8097-8f12cac6f4f0@googlegroups.com>
Subject: Simulating Ethernet between cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3723_232094541.1566217968370"
X-Original-Sender: SebastianSaueressig@gmail.com
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

------=_Part_3723_232094541.1566217968370
Content-Type: multipart/alternative; 
	boundary="----=_Part_3724_297714000.1566217968371"

------=_Part_3724_297714000.1566217968371
Content-Type: text/plain; charset="UTF-8"

Hello,

I wanted to ask if it is possible to establish an Ethernet connection 
between 2 cells.
On my board there are no Ethernet ports I could use, so I have to simulate 
this connection somehow.

Here I came across the topic "shared memory region".
I was able to build the region and *lscpi -v* (inmate cell) gives me :






*03:00.0 Unassigned class [ff01]: Red Hat, Inc Inter-VM shared 
memory        Subsystem: Red Hat, Inc Inter-VM shared memory        Flags: 
fast devsel        Memory at 100000000 (64-bit, non-prefetchable) 
[size=128K]        Memory at 10000000 (32-bit, non-prefetchable) [size=16K]*



I used :             .shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,


Now unfortunately I lack the idea what I should do now. 

On the topic Userspace I/0 I have looked at the examples of Henning Schild.
Am I right here ?


Many greetings
Sebastian Saueressig

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18334f63-04e4-4d66-8097-8f12cac6f4f0%40googlegroups.com.

------=_Part_3724_297714000.1566217968371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I wanted to ask if it is possible to establi=
sh an Ethernet connection between 2 cells.<br>On my board there are no Ethe=
rnet ports I could use, so I have to simulate this connection somehow.<br><=
br><div>Here I came across the topic &quot;shared memory region&quot;.</div=
><div>I was able to build the region and <i>lscpi -v</i> (inmate cell) give=
s me :</div><div><br></div><div style=3D"margin-left: 40px;"><i>03:00.0 Una=
ssigned class [ff01]: Red Hat, Inc Inter-VM shared memory<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Red Hat, Inc Inter-VM shared memo=
ry<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: fast devsel<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 100000000 (64-bit, non-pr=
efetchable) [size=3D128K]<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mem=
ory at 10000000 (32-bit, non-prefetchable) [size=3D16K]<br></i></div><div s=
tyle=3D"margin-left: 40px;"><i><br></i></div><div style=3D"margin-left: 40p=
x;"><i><br></i></div><div><br></div><div>I used : =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_V=
ETH,</div><div><br></div><div><br></div><div>Now unfortunately I lack the i=
dea what I should do now. <br><br>On the topic Userspace I/0 I have looked =
at the examples of Henning Schild.<span class=3D"_username"><span class=3D"=
F0XO1GC-F-a" style=3D"color: rgb(34, 34, 34);"></span></span><br>Am I right=
 here ?<br><br><br>Many greetings<br>Sebastian Saueressig<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/18334f63-04e4-4d66-8097-8f12cac6f4f0%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/18334f63-04e4-4d66-8097-8f12cac6f4f0%40googlegroups.com<=
/a>.<br />

------=_Part_3724_297714000.1566217968371--

------=_Part_3723_232094541.1566217968370--
