Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBVGG4GYAMGQE75K45ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDF8A21B5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:25:26 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dc647f65573sf563818276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712874325; x=1713479125; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pyh1hSm1xU1BW2BF8OW6wYXEfcjFNECrmEOQdS8qi9Y=;
        b=j0/+QLsgnmrjMdtIncPeDIog0nltIkaMeG1+Tu/2qHQdVODKuFpya7//aHAUofM3Vd
         agXRLN72Bdv7YQivg0V77M0hvm4BJIYDve+w75kp3kKFkjrTyQdgUgg4PaG1NNP2IdBN
         BLnphT2mgRA+UnU0CjNqyO2TcszZQGaqqqgYmNIU/kaB25rC44PWqNSfw7F0vUxPqQzA
         AKNoMBrZFJHPlic4HdEGnBWpz5EMj0Xace8mU/iSPMs+gVP2Z7iItDuNd05siB2ULOPK
         m/94ApdDIuo2tIFrXGR12ZJ+7ybMP0bQGqF4kU3+VZrmrU4dfhqR8xYP0usIU7AwvuQa
         pKoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712874325; x=1713479125; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyh1hSm1xU1BW2BF8OW6wYXEfcjFNECrmEOQdS8qi9Y=;
        b=Qoo0m+dBOsEe94VMF6Lv3VEuF3P6jVmNhJIXmthC4hw6olk+cMYiyGhdz00Bx1FuTo
         ssA1VVX/nCDQUG/0ft+2R6qTkz8z6I+kr7oFNGwsoFJ+/8apMwkDDrkeLxmqEbvqVrBL
         2K5f/1S4JTIG6LA8sRwNl/X1q1Rd6P3ak207x76LwCCkMOF4ZzaOOIZyMcs2Z9ndv9C4
         6eXEpFLdWgJ4lV8i0eMxAutJk6pZu0JfpYlD94yTGYqCs3hYnV+6SUDEcrRkQ7iq1SSW
         NBw49zkyM5HUAkROMx9r2G1bDOBFdow7EgNDQZrzSPD0J4zRCCa9FuNyFMrCy70N/v0v
         vGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712874325; x=1713479125;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pyh1hSm1xU1BW2BF8OW6wYXEfcjFNECrmEOQdS8qi9Y=;
        b=jG9zBLIfLx0dt6p0+enm1HJwv3hgwYANxWzTialTFRk2Vt1AwPoP4ku/WB5jDvfFfp
         QH7hd6omGUiN2svIoSuFhTjKv5TanPh0N/b7jJ3WVvz2mP7XhmiX7z/glyKAX7Q3GUHg
         h4hJLQrCSxRK6y3obqJHSp+/arTfEBoGy+WJmtlFIUsfBS+crPskO1PqDiuDBd1VJXY5
         Lnjjq0Jx00r6BbAggsPFYXaD9IYA8c31oKHvYT9Pc+E/RjkpY6T1oXLvAdx+k7U2sdFT
         86Lc7hpND8GbzvR0iFkY2LolOtf/McZrosmHIuyn2fC35Ko9P2sGKqkJ1T+BFfAgGicv
         AgLQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUKnCHxi54jpGBKZv/VTCN57e54J90qubvlUkKBtftkK4bn7JtjVbfsFx6exw8rHG0yvp93hJX54i32fO+uhsK6eWYgFCNy1TdkS0E=
X-Gm-Message-State: AOJu0YxFXwO5FTY2kSzSozqSRnuikF3uZYti1e5ZX0WPHHBy5FekvD2T
	9pp9rx3lYIIoUIiVmJqKxOSf6OTYBnB8A4GAKP/lXxdQVJYsZq2E
X-Google-Smtp-Source: AGHT+IHfNxdahvuvDWG6Qh/LY5ijrmFHHIG1Ql/JOYj4DtqXpYdSf2buA8ZlsSOjosKYg1U2Jwz76A==
X-Received: by 2002:a5b:b52:0:b0:de1:d4e:2338 with SMTP id b18-20020a5b0b52000000b00de10d4e2338mr989591ybr.36.1712874325154;
        Thu, 11 Apr 2024 15:25:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfc2:0:b0:dcd:202d:6be7 with SMTP id w185-20020a25dfc2000000b00dcd202d6be7ls660271ybg.0.-pod-prod-05-us;
 Thu, 11 Apr 2024 15:25:24 -0700 (PDT)
X-Received: by 2002:a81:4f17:0:b0:615:2fd6:4a3c with SMTP id d23-20020a814f17000000b006152fd64a3cmr213787ywb.6.1712874323871;
        Thu, 11 Apr 2024 15:25:23 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:25:23 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <94309553-f59a-4188-9ae7-0db0e7af752an@googlegroups.com>
In-Reply-To: <24836639-c565-4576-874e-726bdee8dcb9n@googlegroups.com>
References: <24836639-c565-4576-874e-726bdee8dcb9n@googlegroups.com>
Subject: Re: dot cell file
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_155756_289148402.1712874323286"
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

------=_Part_155756_289148402.1712874323286
Content-Type: multipart/alternative; 
	boundary="----=_Part_155757_1349081346.1712874323286"

------=_Part_155757_1349081346.1712874323286
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/94309553-f59a-4188-9ae7-0db0e7af752an%40googlegroups.com.

------=_Part_155757_1349081346.1712874323286
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
om/d/msgid/jailhouse-dev/94309553-f59a-4188-9ae7-0db0e7af752an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/94309553-f59a-4188-9ae7-0db0e7af752an%40googlegroups.co=
m</a>.<br />

------=_Part_155757_1349081346.1712874323286--

------=_Part_155756_289148402.1712874323286--
