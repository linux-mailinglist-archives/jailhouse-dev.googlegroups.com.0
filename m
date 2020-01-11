Return-Path: <jailhouse-dev+bncBD7236HKXYJRBEVB43YAKGQEEUXEP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 32135137C88
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 10:08:36 +0100 (CET)
Received: by mail-ot1-x339.google.com with SMTP id f25sf2612646otq.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=biaFz8Z8RYxojft2u7aRvPnk8akukysGHkB/ihre6ZA=;
        b=cKtyec9m/GV/vRXsBOXDDiVrdUzcpRBgocF5hfUsvdR0+a/NQs+EVHF9XHKpzEQB9n
         2Ev6pLhc2Q6UeMRq2YD2dQKPlwAhpkhzvRLbWHTvL/ETZRWhM+Pe+b2gIX8Qz8xJWsoy
         D01s+pcBW/96CSMr0acxZNeIgHNLYEre3h06T0H3bmTYJZWsRqo1R2kPKeOA4RKXm06R
         D6q/KMYvJA8gIOfyVoD8IvFS8qDBv8iJiXor/jK9rMphtAwD32wWBKywhC1pGpZ4kWKd
         xs0r+M7K0bx6kP04XfseXXYjDUXUbRKY4v54hVD8iDnNGtM8DExDb4//uCV2ouIuqGI4
         F14A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=biaFz8Z8RYxojft2u7aRvPnk8akukysGHkB/ihre6ZA=;
        b=YnfGRAGfgohT0n7TNxgc4ut81xSrD6i8QKzrqYZDpIu7jEOWGNLFG6Y7dJBCL74Q5g
         i7m10ebSBwkTA8fO4e7DCOO54jhte7ItTPquerQXZ3KYmSIiq4hfmdEWGvTz/HaZD+3X
         lt40WcByinLbp4gdxM6RO9bZSyTorpI44b5GPJWeaLA/kLBE0gMl1tpGB7uw0eEXrwTV
         QMJ/vsAt1H/nhvsrvmrwnLk8ltKfge2L/utULvaScPsSn3KPONocxSBXN/ezEjRM+7Uq
         thqOkF/Q0mDv49ulb5v0eQkQV3tvcSXQSZoYGU2LFWQq1CO1aqDi9kd17AbGDOmYBD3V
         AAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=biaFz8Z8RYxojft2u7aRvPnk8akukysGHkB/ihre6ZA=;
        b=SLNzEhQD/mtES5yb4s/QlFrhjaHqYixJtKAKngcWPspw4Z+Hn+65KEHoFAhPdgw6BC
         d7m4MqOfjYLwVHZuN6A+IaPWyrrXzN755lx57HA/56R4ZkkGDHq2BddSyy3FhobVc6fK
         9csNvR1z3cwT9LOuK4lQJ6kj5HvVziQHIhmUNB9lHdTmQ0r4uB54GP1gqvUeeWCMz1l4
         ENwQtNSsmAJwskOy+7Bu8JgBiVtBwp4IhMDtAnO8kdPTVkKTO6u5q2HzNZI9tRBAWRA6
         vd5iW4YJJ2U0nC6i2aETXTuPD84Obv7sR5jDAW+L+3OptIcUNLYL6FyMJfWQlsAXMBhf
         p+FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgagxilCGWkxs6U2VT9aFmlvr/sl4NlZsf3kHxSVj1v+T2Jj28
	kbranMjaWaNg8pDUkA6ZOME=
X-Google-Smtp-Source: APXvYqzlhhgvRBxFg1aWI/mkXpKTlQGg93tV/YnjVXdHbVKrt4E+EGhE7JRQHEHALIZvGdrjstCIzQ==
X-Received: by 2002:aca:ec50:: with SMTP id k77mr5915931oih.114.1578733714973;
        Sat, 11 Jan 2020 01:08:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5051:: with SMTP id e78ls1410986oib.13.gmail; Sat, 11
 Jan 2020 01:08:34 -0800 (PST)
X-Received: by 2002:aca:cf50:: with SMTP id f77mr5869217oig.60.1578733714512;
        Sat, 11 Jan 2020 01:08:34 -0800 (PST)
Date: Sat, 11 Jan 2020 01:08:33 -0800 (PST)
From: Thorsten Schulz <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <343f38b5-4fd1-4bcb-89ca-62cc577b3df0@googlegroups.com>
In-Reply-To: <46455211-7834-4791-b623-6c7278584b83@googlegroups.com>
References: <46455211-7834-4791-b623-6c7278584b83@googlegroups.com>
Subject: Re: jailhouse-images/wip/update does not build (incomplete
 commit(?) / rt-version broken)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_985_950474931.1578733713930"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_985_950474931.1578733713930
Content-Type: multipart/alternative; 
	boundary="----=_Part_986_2007587831.1578733713930"

------=_Part_986_2007587831.1578733713930
Content-Type: text/plain; charset="UTF-8"

Sorry, the 2nd is issue is on me:

I should have had a second look into the build system. When on the *wip/update 
branch*, one explicitly has to call `./build-image.sh *--latest*` otherwise 
the newer patches to the build-process clash with the referenced older 
stable version of jailhouse. So, after I had a second coffee ;-) , 

`./build-image.sh --rt --latest` builds flawlessly.

However, the bitbake file for the non-rt 5.4 kernel still seems missing.

Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/343f38b5-4fd1-4bcb-89ca-62cc577b3df0%40googlegroups.com.

------=_Part_986_2007587831.1578733713930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, the 2nd is issue is on me:<br><br><div>I should hav=
e had a second look into the build system. When on the <b>wip/update branch=
</b>, one explicitly has to call `./build-image.sh <b>--latest</b>` otherwi=
se the newer patches to the build-process clash with the referenced older s=
table version of jailhouse. So, after I had a second coffee ;-) , <br></div=
><div><br></div><div>`./build-image.sh --rt --latest` builds flawlessly.</d=
iv><div><br></div><div>However, the bitbake file for the non-rt 5.4 kernel =
still seems missing.</div><div><br></div><div>Thorsten<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/343f38b5-4fd1-4bcb-89ca-62cc577b3df0%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/343f38b5-4fd1-4bcb-89ca-62cc577b3df0%40googlegroups.com<=
/a>.<br />

------=_Part_986_2007587831.1578733713930--

------=_Part_985_950474931.1578733713930--
