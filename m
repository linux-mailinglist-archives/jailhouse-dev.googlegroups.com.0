Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB5OR4GYAMGQE6QFSLGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 573518A21EA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:49:27 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39sf566487276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712875766; x=1713480566; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVxYBzrNBZP+svgDYWVZJ0/n8ltCx05pOuMIGz2aHDA=;
        b=Ny11/e2WUs26200gbWxYugjHxZCUGGUN7XG5gCtu8vpDA4n+l6ddldxo3yY9PUklwX
         mebtfurMOQvO06sUJNUf3pArgBkdImvTVd9E1vMBeIFjID7oKBfae3BqWYAl21Qtf+6B
         N6ExGbUYoJ3ELdILUQS0upZ4Hc93JuwLtmSE4AkTeipJCxlDQ9afpv9fiIU9sPYbY/HO
         RKhEeqhw7ZyJ6suluHNIMtxVKdJABksfTtCiVawBAgg4LhaVegM4UZuoXSsYisHKEydG
         XbKdrYIjko9ghCaFOQN5Yhtpp+cCRekUCj4yyEOEfizBV5pubqw+tgWn/PGaF+SCCKve
         ltbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712875766; x=1713480566; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVxYBzrNBZP+svgDYWVZJ0/n8ltCx05pOuMIGz2aHDA=;
        b=MFoQaMqKWnKaaI2mRSJ+Pgt5M+1cmy1hsd+ic4bXwdy9ixW7qFYB7UdZ2dtptCON8x
         /87MMjho8jpKiuWtvAuU/cLldjmNnCfGgvtpFXzlK5EdKnnyfD2c0Q4TrkM1N9w8GJj5
         MPIBoqp9QY420tbvVDcX0fRCwbXe3QyVUcwRD4Xy7S6ji4nFMySyBWU9F9cFghBRpiZt
         MuRJ7erzfER7jKvqdHgeag16Ae4WuUTFIankkLrEsmPHIuxDsa+4lMba5LWg6YXSRB6Z
         ieTJlTcz05WYXDu/PFmnubNvoLyZch5a/C1Z7fJcS8ayHEpIeljoQ+nqcbwcviIyzmvs
         OjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875766; x=1713480566;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVxYBzrNBZP+svgDYWVZJ0/n8ltCx05pOuMIGz2aHDA=;
        b=BRIU+7dwt9FmyYgeigaXs2d/7OOLNATsMfgkMKdI+ka/Q1rnEYvesDGRcNHbYjFj5C
         0wFy6FJwVJfduYa6bgCXEBbapw0zPW/AtYWICW1xjimMgP4uRFYqlmPkCVbEmoQErbmM
         uGRK7P+2wcqiI8tgvPd34CKIQxqMHiW6eHX4fACirdYSSd+VYOuoBl7RSBdGpRIiLksZ
         qL9bxD6hE5Gnb9funX8i+wGwQ8jPVZle6nRs4CaIw8X7D2GQJGlio/4v3t4SfViHFD0P
         zIQ2bwCeSlN5zglYcTRtHRE3NjT6CURPhGE7t56K4Tf/LkmeoXVJkfT/cs2XTQLEPwAP
         gQ7Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCX9vZhMW5RwUZ7dwJB3Eg6KJl7r4Q35mujDq/Uno9tcTQbHTaXmvbhker2Jaj6rxyigrzEQQgZOv4uaQK1a8kNJIi9/WGOg1lamgeI=
X-Gm-Message-State: AOJu0YwMxZTjbwWBbZIwJCpVIXbNMxuS6lEIxpias3tYFNffExsAXR8X
	7tCfJlE+DJwKjGqfbRddfGqXju6wT7UcYIMiXK1INP5JyhIT9Uuf
X-Google-Smtp-Source: AGHT+IHQTtuTtU9l9rS2EOE6tJ0degB6ewL9neL8I5hFtWgoUXFt6KV6ShwHZZYT2/edz49xEEx1qw==
X-Received: by 2002:a25:f207:0:b0:dd1:3909:bdd with SMTP id i7-20020a25f207000000b00dd139090bddmr861966ybe.65.1712875766282;
        Thu, 11 Apr 2024 15:49:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c447:0:b0:dcd:202d:6be8 with SMTP id u68-20020a25c447000000b00dcd202d6be8ls475052ybf.2.-pod-prod-08-us;
 Thu, 11 Apr 2024 15:49:25 -0700 (PDT)
X-Received: by 2002:a05:6902:18d5:b0:ddd:7581:13ac with SMTP id ck21-20020a05690218d500b00ddd758113acmr276335ybb.2.1712875764803;
        Thu, 11 Apr 2024 15:49:24 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:49:24 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b0dc548f-cb03-40cd-b514-6630781c9facn@googlegroups.com>
In-Reply-To: <CACZYoum=y_y2yahZdCfOFNPPZ4tZPOnY-fXFqiioLbgCK5betg@mail.gmail.com>
References: <CACZYoum=y_y2yahZdCfOFNPPZ4tZPOnY-fXFqiioLbgCK5betg@mail.gmail.com>
Subject: Re: Order#24854
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_211784_1638392063.1712875764146"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_211784_1638392063.1712875764146
Content-Type: multipart/alternative; 
	boundary="----=_Part_211785_1954829385.1712875764146"

------=_Part_211785_1954829385.1712875764146
Content-Type: text/plain; charset="UTF-8"

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b0dc548f-cb03-40cd-b514-6630781c9facn%40googlegroups.com.

------=_Part_211785_1954829385.1712875764146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b0dc548f-cb03-40cd-b514-6630781c9facn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b0dc548f-cb03-40cd-b514-6630781c9facn%40googlegroups.co=
m</a>.<br />

------=_Part_211785_1954829385.1712875764146--

------=_Part_211784_1638392063.1712875764146--
