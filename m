Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB65PY6YAMGQE746IVWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113d.google.com (mail-yw1-x113d.google.com [IPv6:2607:f8b0:4864:20::113d])
	by mail.lfdr.de (Postfix) with ESMTPS id A698389ADA4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:17:17 +0200 (CEST)
Received: by mail-yw1-x113d.google.com with SMTP id 00721157ae682-60cd62fa1f9sf51348857b3.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445436; x=1713050236; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnBIErb121CNGcJ09bJCsVtJ0VnpR6ipzDaOxT4x50g=;
        b=a0oXcpDVzmFN7DXoCz6p2uUwyZopGcA3AIw32REnlM8koF+HmR5sNoOPGiHCYGYxw3
         dxsG83dVrhjrrC+bw8vGJuU9zvFYH2BP3ZWp+fR7XOamABXnPRgKrR99J0Tr61PxjpMJ
         MzK7ZkXdM4vGwq6p4yi/SiJ/osOLqcxPDDpyda3Sf082u8Wx44EXybVnZbsV+vpzT+ti
         61IbFsrbJYjg8ihowqFGeIE9OOfheqP4KauoZCHcgKGIlwXCK5m0edeu1ye53N6JuG4K
         8SRNibrIIFFjiptwrSBdvleYRWG9avjsz/Rb8xt7a2TVjmVxswA/5cxAfAPpZuqg9orB
         yeBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445436; x=1713050236; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnBIErb121CNGcJ09bJCsVtJ0VnpR6ipzDaOxT4x50g=;
        b=XSGnjc6OJVHaZVNOzX36d2xmXevTI/zDauC5J4NBJa0UkQGYloC0ZQXWREdU0z1m4h
         rg/+v4gaxoAHsWccBbPBKPTVO2MeLIWVDVsH9Ou24vVLqOI4rzN93IBG3zbsfUZqpCYV
         r9f1d29yxmyH35Dup3QyDR685LdHEkEVIIegc3m5LSphbTQ4zEvOEcFPymwxsN8x/ax4
         5HtnEmNeyHkX5iCHfVb4UFz6K1POkFKoimGnRL/q/5skULwneZL9pVoIdzialpmzaeKr
         qjY8Nv/3KmpwGBNvxGyu/2zclMxzjAU2yeWi6zQ7ZDIoK7SPF6VLr2JD0p9aUGrlfFQA
         NDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445436; x=1713050236;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnBIErb121CNGcJ09bJCsVtJ0VnpR6ipzDaOxT4x50g=;
        b=eyngyQuCAW0ViKRm72wyD/YT24zeFP5Urzw1Wh1ADJ83vda/bGB/9Ij7q5XzD/BKtG
         prCkZAIkrL8Klsjg+PRFEmuFQ6K21k/FnIsgLUkgn3FmmRmHRRXmwjVnqTKGNV7Kea6l
         W+BQb4BSmig/UPxZxADTeBLxey6MDvRdCj0QuLbARZxfS08ed8MLDQV0cydwxbgke4Ul
         dtlqcTmn17CK1omrQWqx3fY4e7lEnn11wm9VltqorJxBUf3Eu3/2N7a4o2z/A03NvI18
         8gEVacbRW1gTiqQc0hhyb8wBcwx3bRNOr14srIdAzh4bEr0AK8L6Rgew/gUox68Jf9z9
         4w0Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWShJIFw5upbV+pMPcb5BEUtAQjSzfBZXWjREB9gSNtgFrFDzovYZaLT+UtGSSgE1i+JYg1Mxnw7zjN7WKFXJv1BlRaV9AmvWWwRy4=
X-Gm-Message-State: AOJu0Yw12S+9v+LQ5l4k/g63heWiIFZKyylsUoLtbiZft+QKsqPeYydr
	V76Phdwmw1612b3JpOxxK7eU3zUR17SkBqhVO5oYi3Rnfb8bCSiF
X-Google-Smtp-Source: AGHT+IFFfMW0XZodbS2w/gHkoxeBZFzRzeY6uecMDLhEw/EJFBOZNBz4LqwFPoVQjbvl4QmTHfvaHA==
X-Received: by 2002:a25:360a:0:b0:de0:e368:fa59 with SMTP id d10-20020a25360a000000b00de0e368fa59mr1028287yba.31.1712445436527;
        Sat, 06 Apr 2024 16:17:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3506:0:b0:dcc:4b24:c0de with SMTP id c6-20020a253506000000b00dcc4b24c0dels608036yba.0.-pod-prod-00-us;
 Sat, 06 Apr 2024 16:17:14 -0700 (PDT)
X-Received: by 2002:a25:2d1f:0:b0:dd3:f55f:ff02 with SMTP id t31-20020a252d1f000000b00dd3f55fff02mr1594126ybt.1.1712445434457;
        Sat, 06 Apr 2024 16:17:14 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:17:13 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <11e3afcf-1bcc-4eb5-90fb-7b7e9a62bfd0n@googlegroups.com>
In-Reply-To: <dc35efeb-302f-48d8-bad7-daa678a4ae75@oth-regensburg.de>
References: <e06c1b28-3007-421a-960b-a298cfaba7ebn@googlegroups.com>
 <dc35efeb-302f-48d8-bad7-daa678a4ae75@oth-regensburg.de>
Subject: Re: Fail to create sample cell on Intel N6005
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_150862_155994282.1712445433786"
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

------=_Part_150862_155994282.1712445433786
Content-Type: multipart/alternative; 
	boundary="----=_Part_150863_573314375.1712445433786"

------=_Part_150863_573314375.1712445433786
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/11e3afcf-1bcc-4eb5-90fb-7b7e9a62bfd0n%40googlegroups.com.

------=_Part_150863_573314375.1712445433786
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
om/d/msgid/jailhouse-dev/11e3afcf-1bcc-4eb5-90fb-7b7e9a62bfd0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/11e3afcf-1bcc-4eb5-90fb-7b7e9a62bfd0n%40googlegroups.co=
m</a>.<br />

------=_Part_150863_573314375.1712445433786--

------=_Part_150862_155994282.1712445433786--
