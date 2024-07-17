Return-Path: <jailhouse-dev+bncBCWZR36CYUJBBDNT322AMGQEC3HHOQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id C1751933B07
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jul 2024 12:14:39 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-e036440617fsf12958558276.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jul 2024 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1721211278; x=1721816078; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+HKuZn77Z+FaCtJba7Pr+Euop+WF/86J/KCWS/9bso=;
        b=aMT+9SF0ywIuBcyxMgNwDDrDGn7P2flYw4i5/zLx3uhvVRqfKk1Fnq5roWWGMcGswy
         TcqistFBcVkIRRlpstWn6EzDhF5pk/1r+6MY53GFTXe9IFrqgGUlSr6JjW9luDB2dfRC
         VMpV5s9F35Mhf17Y8LDM7V/ZRJItf2i3Y5DUo/qBH4WdD7OwCpIQqxdigzvGcOoFF8AC
         oDFyXFC8wmFXlgJ5vu+PmWsFo7cODG2nnX0BmKHKo5yzYD9NP8BOQfCT/tdiq04LDCWX
         HoXlZxw5gT3uOUk/VwAAggSzV3BG6WeooV1rRvFYl1tJ5kYlKyCjW94SoNZ66rH56+8g
         8Lfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721211278; x=1721816078; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+HKuZn77Z+FaCtJba7Pr+Euop+WF/86J/KCWS/9bso=;
        b=VrNM/qXUiJPcCTpY5SsegA3O5dgrLO75s8lQw0i37qjNsrvVyP49eznrABfZhGLsqZ
         y/QRr9UFro2CSGtelb40QFFOKSbDeVpUFFrcQnfTbKNZYQfkZQXK5EBYdy3RNwaWtjg0
         Kq3ueoBjBfTXiHzdq2MLDTTGIdUdBWRtn68Q432tjZX4O5Qo1VuWD0NhKsgmyMITQiPi
         mjYHo/EhJHs5GCSEh2yQ+e6oJwLL9KqhbDjSMytx9aTv+Z4C5r3cWbjOH+HWmARAFH7z
         SFlSvS9tfq7VKl+Y9MyR9q0aQ7BilSbkMZ2UaxEsnhhOO6bhEyJWzXACwa/gaaXqKMPR
         fTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721211278; x=1721816078;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+HKuZn77Z+FaCtJba7Pr+Euop+WF/86J/KCWS/9bso=;
        b=G3ysYOQIWlruPca2Jz85RT/CrJjkp96Aowmpm5MAfAJlTehJPwV5hHWabvSBg95vRh
         EbicACLFgUZ85N95Z+836IKtWpH86NKiajVPrko9JN1RsBUD1cUTzIRB6MLGpIQUd1mN
         +vazAxZoyigAxAuLfeau++8XpJlt8apPQjdJ3vkZJFbF7RhEjNH7CJAprk93iE4DB9oe
         0V0x6tN8HzFUi14EGIt7B4gPnPFff/0K1JCdvgpmGX/VwizsAZbo62xResyZZS0mOBkh
         GWutW3/aho4VJ7AaQ3FOqIzW2Ysqp0XwZPtCD1dfOn8n91OuoQPD/mAF4XURGFqp5npF
         y8JA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWx0DRt3G/RBs2IIpcmpJYpLUh+u0iACMuYQnC5HRVcSGQ8m/XWDkymYQ3gPKw/eNuYUb0NYq66fc60U5kCasuZD9zloTQmKC+h1yw=
X-Gm-Message-State: AOJu0Yxw+xA8EfQ/AuaKmEwEBI3fFb5eqyaSHS9Kg/7Xi7/YgFhHrM0x
	YhB7UmBFwDKeFX5k3SJi12bXBQtB/SHKKN020+QcWAZmHeKBrofz
X-Google-Smtp-Source: AGHT+IHUoxHTkMqRnzX015C35A2UrTm/mMO9XWZiV1AoDodU/t9DPAwS1cWaTcjal5CQA57zbI6bjg==
X-Received: by 2002:a05:6902:c06:b0:e03:5ecb:9e6 with SMTP id 3f1490d57ef6-e05ed6d24f6mr1517342276.16.1721211278140;
        Wed, 17 Jul 2024 03:14:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1008:b0:e03:37d1:efbd with SMTP id
 3f1490d57ef6-e057923fa67ls9739255276.2.-pod-prod-04-us; Wed, 17 Jul 2024
 03:14:37 -0700 (PDT)
X-Received: by 2002:a05:690c:fc7:b0:62d:a29:537f with SMTP id 00721157ae682-664fe071c6dmr1102297b3.4.1721211276825;
        Wed, 17 Jul 2024 03:14:36 -0700 (PDT)
Date: Wed, 17 Jul 2024 03:14:36 -0700 (PDT)
From: Franknoel Njubuin <franknoelnjubuin@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <36a912ef-bfe7-4802-8757-23b86ebbaaa6n@googlegroups.com>
Subject: Greetings fam
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_161782_516851684.1721211276306"
X-Original-Sender: franknoelnjubuin@gmail.com
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

------=_Part_161782_516851684.1721211276306
Content-Type: multipart/alternative; 
	boundary="----=_Part_161783_1777993636.1721211276306"

------=_Part_161783_1777993636.1721211276306
Content-Type: text/plain; charset="UTF-8"

New here

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/36a912ef-bfe7-4802-8757-23b86ebbaaa6n%40googlegroups.com.

------=_Part_161783_1777993636.1721211276306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

New here

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/36a912ef-bfe7-4802-8757-23b86ebbaaa6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/36a912ef-bfe7-4802-8757-23b86ebbaaa6n%40googlegroups.co=
m</a>.<br />

------=_Part_161783_1777993636.1721211276306--

------=_Part_161782_516851684.1721211276306--
