Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBBWK4GYAMGQECZNAIYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFE8A21BF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:32:40 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dc6ceade361sf597409276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712874759; x=1713479559; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eN59y6PRXou4c4v2yP3TVckallZ75CjdQEVc6dwhDKU=;
        b=cehDmO/XmY39jJvwI0nyzBSUBPdOC5mPn+mwGBTBluyFIrDMP1IoDbTeiEPN0LA3D8
         IgHwrx+uaVZ8ySaVhsXX73OuuG25P10Mi/J9wS6jyN9efACjgoYXIQEadD5b23WIfkQ5
         pdytuRARFVIlrja3iFsMkOOFhaWaWBogA6oxqa1T6J/D0BqHbyXpz0Wj4pIRnzzYvWD1
         krGIzFP0fpGgh/n9MEw4SAPOdu5Wp0UUshIlPnnvyikuUpnlR9lOiuRQSU6wgBKSQg5j
         1SwKW9roLJg5rJ7rMmF8ieNaaC6VZ5wavGaY/h4oaH6P7P4eHofWRIa/xbiGG5bEEUT+
         Xipg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712874759; x=1713479559; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN59y6PRXou4c4v2yP3TVckallZ75CjdQEVc6dwhDKU=;
        b=EkSNWfVMT5f5KxtUITAoukzUId6wXgkSJfBJ3eruCKcdGTBAgREdVkcfLp6zDpP6In
         oCult5IunYV21+BLJXhmSOvDxygnQcbIfEV622HUa22rDlLSp4gc+Wd7OqQizyVsk7NW
         V+m4Oq/ofI6AOkL2KjJXDz22dqNfxIALDQpChisbj1lRQhdG6motTea2WjXex4i0SMm4
         y0Bv7lZY1nomsdXV3IJBThXzu8XAlfrvB/ydOAub0b3DT3tO2Xom3SM8cAqlZjbm0COo
         eCqj2KK2LHzRkZWZSzlARm7tlkWCoKKc1qZZoWxnKDO0qlvG2Up/WrM3a72+M7GTCqMu
         PuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712874759; x=1713479559;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eN59y6PRXou4c4v2yP3TVckallZ75CjdQEVc6dwhDKU=;
        b=nDipJTfyPSzhxBseQ3uozqqflm/ie/5iRU+G48MThu/vupaxRyzwVLvD6bkhy5wRQ8
         8yOd3OBOoW/MCQ1SNRqnS9HLsn+2sXEkUaym7JUWqhHyEJy3NnJ8Hc3fKa+I7xOiRgHm
         v4IL8LbWGsxkURM1sW49gB0ZlBjrppprrw+idD+9M1kBUqJNAndP7jLSHVVSQNTHTaxV
         ZSlwVoNJ5LaVr1ZgsabAS10HMChU6kTxm+w3UygdvjcLl0P4wGYWjGu6RjqNnk7Dj+1z
         Zp1dFcoxGItUnsTyKDGwM10Bf06yR1mzvjP4fxIafBVLZYr3kv1B54jyDUqjBITEDwwC
         vpJg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXNeAcgGx9LX63oXFSpF8dTxsQqgHkQ/CtO68ZC+iFSEZXPHQ6efe1jHxIgEIlhN054osImII1aOV9w0yd/UBH3tLcrqM491X2KRFs=
X-Gm-Message-State: AOJu0YyKnnmJt9tVUUwIXY4Rl6I+h5WUxvJVuxzI58aDeeaiM7ScEAXN
	tW7JVM8OKP2rinrJxxcBN2UI+mjt5vjF7D1dpUvXUL1NdA0ZCOEN
X-Google-Smtp-Source: AGHT+IFohtSWlMjqGjiuc5hfzRnqJcYwmsmm37OmcYMRPDBuUm8zu2/3XVSd62mYg+yapcwTvXn3dg==
X-Received: by 2002:a25:d6c4:0:b0:dc2:3f75:1f79 with SMTP id n187-20020a25d6c4000000b00dc23f751f79mr889238ybg.23.1712874759163;
        Thu, 11 Apr 2024 15:32:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74c3:0:b0:dcc:717f:41b7 with SMTP id p186-20020a2574c3000000b00dcc717f41b7ls676909ybc.0.-pod-prod-07-us;
 Thu, 11 Apr 2024 15:32:37 -0700 (PDT)
X-Received: by 2002:a25:9886:0:b0:dd9:4ad1:a1f7 with SMTP id l6-20020a259886000000b00dd94ad1a1f7mr214328ybo.9.1712874757378;
        Thu, 11 Apr 2024 15:32:37 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:32:36 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5ff8d82f-2de5-4c53-b8bf-05e42e0fb128n@googlegroups.com>
In-Reply-To: <ZdgYI3dIQ0q6uSyyGMl3YA@geopod-ismtpd-0>
References: <ZdgYI3dIQ0q6uSyyGMl3YA@geopod-ismtpd-0>
Subject: Re: F1 Paddock Club - British Grand Prix 2024 - Cancellation
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_92930_1906138619.1712874756516"
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

------=_Part_92930_1906138619.1712874756516
Content-Type: multipart/alternative; 
	boundary="----=_Part_92931_673765517.1712874756516"

------=_Part_92931_673765517.1712874756516
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

On Thursday, November 2, 2023 at 7:30:01=E2=80=AFAM UTC+1 Priv=C3=A8 Global=
 wrote:

> Access the Red Bull suite at a discounted rate!=E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F=20
> =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD=20
> =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD=20
> =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD=20
> =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD=20
> =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD=20
>
> Existing news for F1 fans, we've just had a cancellation on a private=20
> table for 8 guests for the F1 Paddock Club at the British Grand Prix taki=
ng=20
> place at Silverstone between 4th-7th July 2024.
>
> Typically, 3 days passes for the Paddock Club (with pit lane passes=20
> included) are priced at =C2=A33k per person. However, we can offer these =
8=20
> places at a discounted rate of just =C2=A31,495 per person +VAT.=20
>
> Package Inclusions:
>
> - Entry to the Red Bull Racing hospitality suite in the Formula 1 Paddock=
=20
> Club=E2=84=A2 with excellent on-track views
> =20
> - All-day hospitality in the Red Bull Racing hospitality suite with=20
> gourmet cuisine and an open bar serving premium drinks.
> =20
> - Appearances by key team personnel, including race drivers Max Verstappe=
n=20
> and Sergio P=C3=A9rez.
> =20
> - Guided tour of the Red Bull Racing garage where you can get=20
> behind-the-scenes access to the team's operational strategies throughout=
=20
> the weekend.
> =20
> - Daily walks in the pit lane, where you can get an up-close view as the=
=20
> mechanics prepare the cars for racing.
> =20
> - Prime viewing from above the pit lane and team garages, looking over th=
e=20
> start/finish line, with free grandstand seating available as well.
> =20
> - All day open bar serving Champagne, fine wines, premium spirits, beers,=
=20
> soft drinks, tea & coffee.
> =20
> - Gourmet luncheon starting with a plated starter, followed by a sumptuou=
s=20
> buffet.
>
> =20
>
> This is a huge opportunity to attend the F1 next year at Silverstone and=
=20
> these places will be sold on a first come, first serve basis.=20
>
> If you do wish to make a reservation, reply to this email or give me a=20
> call on 0203 576 4529 and I will be happy to assist you further.
>
> Kind regards,=20
>
> =20
>
> Daniel De'Russo=20
>
> Head of Global Corporate Sales=20
>
> *Priv=C3=A8 Global Events*
> *To reserve this table, please do not hesitate to call me or reply to thi=
s=20
> email and I be happy to assist you further.*
>
> *Daniel De'Russo*=20
>
> Head of Global Corporate Sales=20
>
> *Priv=C3=A8 Global Events*=20
>
>   t:  +44 203 576 4529 <(203)%20576-4529>
>
> The content of this email is confidential and intended for the recipient=
=20
> specified in message only. It is strictly forbidden to share any part of=
=20
> this message with any third party, without a written consent of the sende=
r.=20
> If you received this message by mistake, please reply to this message and=
=20
> follow with its deletion, so that we can ensure such a mistake does not=
=20
> occur in the future. =20
>
> Registered Company Name - Prive Global Sports. Company no. - 12537476 =20
> No longer want to receive these emails? Unsubscribe=20
> <https://trk.klclick1.com/ls/click?upn=3D7ZpdBophAwrZEeo9o6yKdFTuapAr443S=
X9b-2FWtUFY0aQ4EDdKqo0cmaycS-2BCtCLV5lfwrFIQxHjYlWsE5ySLc9-2FdBUBtRJsr27VQQ=
-2Fz2a2d4AkfkL-2BMZH7UQqWV7ziARPaRzUpFRcLJwjvwpnNMW-2BUlP3QjSSasktOdLqRPhfe=
JfqNbPcKu943-2F7PdLH2cFpEFDj7neNeElcdUrrVd9z7V-2FGzOyQGP1JwZX8S6lKF-2BN8gVN=
KVWtrMkI6HGskhnMbVKTR_yxe3hxlEKZLb36qs-2BKApVr7ZX4aFxpSJbhjNkBlCEPRTGIvXkRp=
tALDz9gXFwao88ZUyCDoej4CkYev8v0LAm5TojJRoEDhUFtWSRQKYSjtHzDAvCvmBvIlxxincGH=
AfjDnutWg7K5dU1YcS0PHiKMbd3Y-2FGFwaxkK-2B2IYgFSRdmHnpwsA3MIWK1zN4966rDtbi4Q=
i6snE1GBwQIxCZb9eDKtznsj4X2mxdrXzjLlhc-2BDdf1PNd3MYNtGTB-2B-2BUtrPsQUXUIcS8=
wfSelgmyEoEBT6sYkdSE5R2M7Ei2dfkqTNftA6wnzKbsuLgk0S-2Fc0NUsx6ogQD-2BdEUe1Rex=
j-2FlIN-2BKJeMELk9e544zkHPXFhTBFXHcQTlQqmX4FmGLnmMU2l7iwCv3rjnVa-2BkY80u65i=
PgNPhEVnz6O4Dqr0YGXfdqVqoKVuHeYonbUyUyByn4gSFR-2BfJ-2FN9ZWVbJQwOJ6Yw-3D-3D>
> .
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5ff8d82f-2de5-4c53-b8bf-05e42e0fb128n%40googlegroups.com.

------=_Part_92931_673765517.1712874756516
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
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Thursday, November 2, 2023 at 7:30:01=E2=80=AFAM UTC+1 Priv=C3=A8 Global w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><u></u>









<div style=3D"word-spacing:normal;background-color:#f7f7f7">
<div style=3D"display:none;font-size:1px;color:#ffffff;line-height:1px;max-=
height:0px;max-width:0px;opacity:0;overflow:hidden">
      Access the Red Bull suite at a discounted rate!=E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=
=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=
=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=
=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =
=E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=CD=8F =E2=80=87=
=CD=8F =E2=80=87=CD=8F =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=
=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =
=C2=AD =C2=AD =C2=AD =C2=AD =C2=AD =C2=AD
    </div>
<div style=3D"background-color:#f7f7f7">
<div>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%">
<tbody>
<tr>
<td>

<div style=3D"margin:0px auto;max-width:600px">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:0px;text-align:center">

<div style=3D"background:#ffffff;background-color:#ffffff;margin:0px auto;b=
order-radius:0px 0px 0px 0px;max-width:600px">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"background:#ffffff;background-color:#ffffff;wi=
dth:100%;border-radius:0px 0px 0px 0px">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:0px;=
padding-left:0px;padding-right:0px;padding-top:0px;text-align:center">

<div>

<div style=3D"display:table;table-layout:fixed;width:100%">

<div style=3D"display:table-cell;vertical-align:top;width:100%">
</div>

</div>

</div>

</td>
</tr>
</tbody>
</table>
</div>

</td>
</tr>
</tbody>
</table>
</div>

</td>
</tr>
</tbody>
</table>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%">
<tbody>
<tr>
<td>

<div style=3D"margin:0px auto;max-width:600px">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"width:100%">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:0px;text-align:center">

<div style=3D"background:#ffffff;background-color:#ffffff;margin:0px auto;b=
order-radius:0px 0px 0px 0px;max-width:600px">
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"background:#ffffff;background-color:#ffffff;wi=
dth:100%;border-radius:0px 0px 0px 0px">
<tbody>
<tr>
<td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding-bottom:0px;=
padding-left:0px;padding-right:0px;padding-top:0px;text-align:center">

<div>

<div style=3D"display:table;table-layout:fixed;width:100%">

<div style=3D"display:table-cell;vertical-align:top;width:100%">
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci3.googleusercontent.com/proxy/f2Xxtu6Pk1AcRad-7YpwSbK=
CDeHIsebV2z1RzOlkWJ4Fm-sF0VB88gjwN232JEqEBa2E8aQhOEMiQ4FJmBxjrEv8CMr-N1Pvex=
NV76tsdGYvkID3myiDr2jpo1vnHONC1exQupc6fT8HEpW_nOl0SzOCmITFoj0=3Ds0-d-e1-ft#=
https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/02f249a1-3df8-4=
bda-ac3e-07acbc209574.png" style=3D"display:block;outline:none;text-decorat=
ion:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:9px;padding-right:18px;padding-=
bottom:9px;padding-left:18px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" style=3D"font-size:0px;padding:0px;padding-top:0px;paddi=
ng-right:0px;padding-bottom:0px;padding-left:0px;word-break:break-word">
<div style=3D"font-family:&#39;Helvetica Neue&#39;,Arial;font-size:14px;fon=
t-style:normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-alig=
n:left;color:#222427"><p><span><span>Existing news for F1 fans, we&#39;ve j=
ust had a cancellation on a private table for 8 guests for the F1 Paddock C=
lub at the British Grand Prix taking place at Silverstone between 4th-7th J=
uly 2024.</span></span></p>
<p><span><span>Typically, 3 days passes for the Paddock Club (with pit lane=
 passes included) are priced at =C2=A33k per person. However, we can offer =
these 8 places at a discounted rate of just <span style=3D"font-weight:bold=
">=C2=A31,495</span>=C2=A0<span style=3D"font-weight:bold">per person +VAT<=
/span>.=C2=A0</span></span></p>
<div>
<div dir=3D"ltr">
<div></div>
</div>
</div>
<p style=3D"text-align:center"><span style=3D"text-decoration:underline"><s=
pan>Package Inclusions:</span></span></p>
<blockquote>
<div dir=3D"ltr">
<div>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation">
<tbody>
<tr>
<td>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td>
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left">
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold">- <span>Entry to the Red Bull Racing hospitality suite in the Form=
ula 1 Paddock Club</span><sup>=E2=84=A2</sup><span>=C2=A0with excellent on-=
track views</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>=C2=A0</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>- All-day hospitality in the Red Bull Racing hospitality sui=
te with gourmet cuisine and an open bar serving premium drinks.</span></spa=
n></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>=C2=A0</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>- Appearances by key team personnel, including race drivers =
Max Verstappen and Sergio P=C3=A9rez.</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>=C2=A0</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>- Guided tour of the Red Bull Racing garage where you can ge=
t behind-the-scenes access to the team&#39;s operational strategies through=
out the weekend.</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>=C2=A0</span></span></div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold"><span>- Daily walks in the pit lane, where you can get an up-close=
 view as the mechanics prepare the cars for racing.</span></span></div>
<div style=3D"text-align:center">=C2=A0</div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold">- Prime viewing from above the pit lane and team garages, looking =
over the start/finish line, with free grandstand seating available as well.=
</span></div>
<div style=3D"text-align:center">=C2=A0</div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold">- All day open bar serving Champagne, fine wines, premium spirits,=
 beers, soft drinks, tea &amp; coffee.</span></div>
<div style=3D"text-align:center">=C2=A0</div>
<div style=3D"text-align:center"><span style=3D"font-style:italic;font-weig=
ht:bold">- Gourmet luncheon starting with a plated starter, followed by a s=
umptuous buffet.</span></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</blockquote>
<p style=3D"padding-bottom:0">=C2=A0</p></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci4.googleusercontent.com/proxy/6qg45X2LU0syqdytSqKRb5f=
BpXSZMmW3kxn1p8EQEGCXBeD64rktdQkGSdO_or4tOm2_MoVE-Xp2dpLU6pbRvQLrD0a8ul5TV_=
SOgkM9-Vgp2fL6ZGFR7kEVorxX077qGPWbemc7K5tG9f88ktoQ43CABocUQWc=3Ds0-d-e1-ft#=
https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/bbc186af-cceb-4=
6a1-87df-aac3cb179ff5.png" style=3D"display:block;outline:none;text-decorat=
ion:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci5.googleusercontent.com/proxy/9mNERBwRLw03arIYGKi-70F=
NLlXQpJV8wKo2U-8zgtFKkhwU5-W7sEPbysNS0rlZN3E3zgGgcWPxekfPA8BWBJ225Wbf_jLBKB=
_1BA5x3ODbc-xBxEZKJWFjA9svuHUF5neZe0-zhADWEN0_81ygHy5529EJe0w=3Ds0-d-e1-ft#=
https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/92b5c00e-e251-4=
2c0-bf66-a2ca79f5495c.png" style=3D"display:block;outline:none;text-decorat=
ion:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci4.googleusercontent.com/proxy/Hmnrpk8gvry5abmwfuudN9I=
vzGaHnySFkQeMKjAh6cEa3vW1jsqWtpD40MokUyTiAGXFvJ5hXqzISBmZE7FxyBk77icZnrQ3f8=
w2aUfo92sed9oWvDiwPhQxQZvQSd6XmCXzxWGmF2fxGCVG_IQUQSgLN3R1Stg=3Ds0-d-e1-ft#=
https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/0aa1dde5-72b7-4=
8c4-ac20-4f7ebe7da27a.png" style=3D"display:block;outline:none;text-decorat=
ion:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci3.googleusercontent.com/proxy/Iu4ksEqihmuGPZ_0CSdC8GE=
W_et2DKzj1M3emxoz8Szi-ubWiCx-gAucmLu1CaPQi9wS-kbvaG64YrR-P-BI1MSX20X7zykrZ7=
1eTqpWfhntDJGV715sM07pwtfDztEnz6YgD0CAnvIIsdvyODMxrnmpPuW6Nhux=3Ds0-d-e1-ft=
#https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/6ddf9296-4fd7-=
4980-8cac-f3e280225e69.jpeg" style=3D"display:block;outline:none;text-decor=
ation:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci3.googleusercontent.com/proxy/tQtVk8t9o3YeSABDIGzKDma=
LKltqyoGkyXq9mFkFEfSs81eN_0T4pHwuJkQBJtG0Zl5rowQvHVZN3G2BEhUJuhJ_jXZfMMlo-s=
nh87lsylIxHAUQQLau41axtrt5KrDRGtWTQXogejbsfAT6Im81C8I60PH-NwRv=3Ds0-d-e1-ft=
#https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/f90bd904-3e69-=
4cbc-bb75-ebb8f1a9b73b.jpeg" style=3D"display:block;outline:none;text-decor=
ation:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:600px" valign=3D"top">
<img src=3D"https://ci3.googleusercontent.com/proxy/0SXX3yLV57imGl8nTXaEFBZ=
Jo3qPRzNiXq8tqYXIYjWByetoNpdJVA5qdvZDn40gXtUH5KxzaXGmCcpt6LNNSKKv2QFH_orvRL=
hSvcUrMyvQM9mWi0CSgmVBv0B7y9YTCLJQ6mvtSPfAaxgM4ZnWucFyKedrZ8ds=3Ds0-d-e1-ft=
#https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/f305b926-0784-=
4803-a628-d1074b01dd50.jpeg" style=3D"display:block;outline:none;text-decor=
ation:none;min-height:auto;font-size:13px;width:100%" width=3D"600">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:9px;padding-right:18px;padding-=
bottom:9px;padding-left:18px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" style=3D"font-size:0px;padding:0px;padding-top:0px;paddi=
ng-right:0px;padding-bottom:0px;padding-left:0px;word-break:break-word">
<div style=3D"font-family:&#39;Helvetica Neue&#39;,Arial;font-size:14px;fon=
t-style:normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-alig=
n:left;color:#222427"><p><span><span>This is a huge opportunity to attend t=
he F1 next year at Silverstone and these places will be sold on a first com=
e, first serve basis. </span></span></p>
<p><span><span>If you do wish to make a reservation, reply to this email or=
 give me a call on </span>0203 576 4529 <span>and I will be happy to assist=
 you further.</span></span></p>
<p><span><span>Kind regards,</span></span><span>=C2=A0</span></p>
<p><span>=C2=A0</span></p>
<p><span><span>Daniel De&#39;Russo</span></span><span>=C2=A0</span></p>
<p><span><span>Head of Global Corporate Sales</span></span><span>=C2=A0</sp=
an></p>
<p style=3D"padding-bottom:0"><span><strong><span>Priv=C3=A8 Global Events<=
/span></strong></span></p></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:9px;padding-right:18px;padding-=
bottom:9px;padding-left:18px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" style=3D"font-size:0px;padding:0px;padding-top:0px;paddi=
ng-right:0px;padding-bottom:0px;padding-left:0px;word-break:break-word">
<div style=3D"font-family:&#39;Helvetica Neue&#39;,Arial;font-size:14px;fon=
t-style:normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-alig=
n:left;color:#222427"><div><span style=3D"font-weight:400"><strong>To reser=
ve this table, please do not hesitate to call me or reply to this email and=
 I be happy to assist you further.</strong></span></div></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;word-break:break-word">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"border-col=
lapse:collapse;border-spacing:0px">
<tbody>
<tr>
<td style=3D"border:0;padding:0px 0px 0px 0px;width:200px" valign=3D"top">
<img src=3D"https://ci5.googleusercontent.com/proxy/B3c6PgXHcCwxCkVOK9Ozbsv=
xgHJsPbCuEcPvfxPr_ueVgKCrsWZtR7NkEJvyVFn2p00UufGd4of3np8NdNc2jiC7qA35nLzih6=
0BdYhIgvbJUOg3r5Ibmu76UXYoXXx8ekM82gEzh9FYnsueqGEzildBqHCzO9Y=3Ds0-d-e1-ft#=
https://d3k81ch9hvuctc.cloudfront.net/company/W7Aufs/images/d09953c4-b4ad-4=
31a-974e-c7880a406e97.png" style=3D"display:block;outline:none;text-decorat=
ion:none;min-height:auto;font-size:13px;width:100%" width=3D"200">
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:9px;padding-right:18px;padding-=
bottom:9px;padding-left:18px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"left" style=3D"font-size:0px;padding:0px;padding-top:0px;paddi=
ng-right:0px;padding-bottom:0px;padding-left:0px;word-break:break-word">
<div style=3D"font-family:&#39;Helvetica Neue&#39;,Arial;font-size:14px;fon=
t-style:normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-alig=
n:left;color:#222427"><p align=3D"center"><span><strong><span>Daniel=C2=A0D=
e&#39;Russo</span></strong></span><span>=C2=A0</span></p>
<p align=3D"center"><span><span>Head of Global Corporate Sales</span></span=
><span>=C2=A0</span></p>
<p align=3D"center"><span><strong><span>Priv=C3=A8 Global Events</span></st=
rong></span><span>=C2=A0</span></p>
<p align=3D"center"><span><span>=C2=A0</span></span><span>=C2=A0</span><spa=
n><span>t: </span></span><span>=C2=A0+44 </span><span style=3D"text-align:l=
eft"><a href=3D"tel:(203)%20576-4529" value=3D"+12035764529" target=3D"_bla=
nk" rel=3D"nofollow">203 576 4529</a></span></p>
<p align=3D"center"><span style=3D"font-size:10px"><span>The content of thi=
s email is confidential and intended for the recipient specified in message=
 only. It is strictly forbidden to share any part of this message with any =
third party, without a written consent of the sender. If you received this =
message by mistake, please reply to this message and follow with its deleti=
on, so that we can ensure such a mistake does not occur in the future.=C2=
=A0</span>=C2=A0</span></p>
<p align=3D"center" style=3D"padding-bottom:0"><span style=3D"font-size:10p=
x"><span>Registered Company Name - Prive Global Sports. Company no. - 12537=
476=C2=A0</span>=C2=A0</span></p></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>

</div>


<div style=3D"display:table;table-layout:fixed;width:100%">

<div style=3D"display:table-cell;vertical-align:top;width:100%">
<div style=3D"font-size:0px;text-align:left;direction:ltr;vertical-align:to=
p;width:100%">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" style=3D"width:100%" width=3D"100%">
<tbody>
<tr>
<td style=3D"vertical-align:top;padding-top:0px;padding-right:0px;padding-b=
ottom:0px;padding-left:0px">
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" width=3D"100%">
<tbody>
<tr>
<td align=3D"center" style=3D"font-size:0px;padding:0px;padding-top:9px;pad=
ding-right:18px;padding-bottom:9px;padding-left:18px;word-break:break-word"=
>
<div style=3D"font-family:&#39;Helvetica Neue&#39;,Arial;font-size:12px;fon=
t-style:normal;font-weight:400;letter-spacing:0px;line-height:1.3;text-alig=
n:center;color:#727272"><div>No longer want to receive these emails? <a sty=
le=3D"color:#197bbd;font-weight:normal;text-decoration:underline" href=3D"h=
ttps://trk.klclick1.com/ls/click?upn=3D7ZpdBophAwrZEeo9o6yKdFTuapAr443SX9b-=
2FWtUFY0aQ4EDdKqo0cmaycS-2BCtCLV5lfwrFIQxHjYlWsE5ySLc9-2FdBUBtRJsr27VQQ-2Fz=
2a2d4AkfkL-2BMZH7UQqWV7ziARPaRzUpFRcLJwjvwpnNMW-2BUlP3QjSSasktOdLqRPhfeJfqN=
bPcKu943-2F7PdLH2cFpEFDj7neNeElcdUrrVd9z7V-2FGzOyQGP1JwZX8S6lKF-2BN8gVNKVWt=
rMkI6HGskhnMbVKTR_yxe3hxlEKZLb36qs-2BKApVr7ZX4aFxpSJbhjNkBlCEPRTGIvXkRptALD=
z9gXFwao88ZUyCDoej4CkYev8v0LAm5TojJRoEDhUFtWSRQKYSjtHzDAvCvmBvIlxxincGHAfjD=
nutWg7K5dU1YcS0PHiKMbd3Y-2FGFwaxkK-2B2IYgFSRdmHnpwsA3MIWK1zN4966rDtbi4Qi6sn=
E1GBwQIxCZb9eDKtznsj4X2mxdrXzjLlhc-2BDdf1PNd3MYNtGTB-2B-2BUtrPsQUXUIcS8wfSe=
lgmyEoEBT6sYkdSE5R2M7Ei2dfkqTNftA6wnzKbsuLgk0S-2Fc0NUsx6ogQD-2BdEUe1Rexj-2F=
lIN-2BKJeMELk9e544zkHPXFhTBFXHcQTlQqmX4FmGLnmMU2l7iwCv3rjnVa-2BkY80u65iPgNP=
hEVnz6O4Dqr0YGXfdqVqoKVuHeYonbUyUyByn4gSFR-2BfJ-2FN9ZWVbJQwOJ6Yw-3D-3D" tar=
get=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://trk.klclick1.com/ls/click?upn%3D7ZpdBophAwr=
ZEeo9o6yKdFTuapAr443SX9b-2FWtUFY0aQ4EDdKqo0cmaycS-2BCtCLV5lfwrFIQxHjYlWsE5y=
SLc9-2FdBUBtRJsr27VQQ-2Fz2a2d4AkfkL-2BMZH7UQqWV7ziARPaRzUpFRcLJwjvwpnNMW-2B=
UlP3QjSSasktOdLqRPhfeJfqNbPcKu943-2F7PdLH2cFpEFDj7neNeElcdUrrVd9z7V-2FGzOyQ=
GP1JwZX8S6lKF-2BN8gVNKVWtrMkI6HGskhnMbVKTR_yxe3hxlEKZLb36qs-2BKApVr7ZX4aFxp=
SJbhjNkBlCEPRTGIvXkRptALDz9gXFwao88ZUyCDoej4CkYev8v0LAm5TojJRoEDhUFtWSRQKYS=
jtHzDAvCvmBvIlxxincGHAfjDnutWg7K5dU1YcS0PHiKMbd3Y-2FGFwaxkK-2B2IYgFSRdmHnpw=
sA3MIWK1zN4966rDtbi4Qi6snE1GBwQIxCZb9eDKtznsj4X2mxdrXzjLlhc-2BDdf1PNd3MYNtG=
TB-2B-2BUtrPsQUXUIcS8wfSelgmyEoEBT6sYkdSE5R2M7Ei2dfkqTNftA6wnzKbsuLgk0S-2Fc=
0NUsx6ogQD-2BdEUe1Rexj-2FlIN-2BKJeMELk9e544zkHPXFhTBFXHcQTlQqmX4FmGLnmMU2l7=
iwCv3rjnVa-2BkY80u65iPgNPhEVnz6O4Dqr0YGXfdqVqoKVuHeYonbUyUyByn4gSFR-2BfJ-2F=
N9ZWVbJQwOJ6Yw-3D-3D&amp;source=3Dgmail&amp;ust=3D1712960896338000&amp;usg=
=3DAOvVaw2MoYHh_8q2sKXEcZvVfI_e">Unsubscribe</a>.<br><br></div></div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</div>

</div>

</div>

</td>
</tr>
</tbody>
</table>
</div>

</td>
</tr>
</tbody>
</table>
</div>

</td>
</tr>
</tbody>
</table>
</div>
</div>

<img src=3D"https://ci4.googleusercontent.com/proxy/ynEUVGKgQEz5ndczPDl86-1=
D7zsm3DkjJdHNHyyJ22FSqX0AQYBk2OirlBm0J92ZordtA8E4AMOHzdGahBk65QvDuCry-V_W7E=
NZTUGaGwVz1whpCqnxv5Jil0evXYFLV7v5T_ieFccx6Guf5LcENKsHJqepwadryvYJuoct10QAY=
XTodwcP9b_v0Y4cEJgI_MoIh56vp8ZYe6XgZnrRg4jNA6Afx_aRZR9w24_YZN2_mdJboLNyIPTW=
PK1ufHNDFzrGNRLEIC9fZqW3lwXVy9XRtIKGXSBxpR_OaOrDEYGv3rJMRYyqGXyQGPeCy23zSpa=
HD1-GbOBuV8mKm0e2IfKp3AGMOv7dVEVBNo3bJNI19OuisjeD4CW4F0uarx_hhDdo9AUZ3dCWoj=
YJ3YQXieMClQnN3AWDgFyKuqsj3r70PIQhPqQKWn2gwrQ4SOinSvlCeCYzsAJ5Jeyq4Q5Ix0Ve6=
dgmyT2_VaUj1v2kaj_zfIodAp8H0vpZf0gDjEInhjJOt_6AcGW94iri5KfPpo7VW8B0W35gK2Cc=
Mi24syrWTwIHRogVAhAjLKR92DJC9-sDgnYoidDxxextHeaYnxuI3Ib8Cw_CTIhxFMIRs0SCo3w=
LBtPriWY-sU8eoWCrxYGfbrGGnpERsUkRR3njMdUsjvstIVfxAxY7vSSi4UjZn0Hzb7YoqOo9x5=
Y8q-sSYjaZSXlvhoHhz7DAiZf-iN57PfoVHxIbCagbbT8GKH0I7PFDHQ=3Ds0-d-e1-ft#https=
://trk.klclick1.com/wf/open?upn=3DVU2koNEWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9q=
CyhTBcX6PA5-2FoCvlZEaOPsPJfZOdCiZZeabIGzW73Ztb9K459lgoJkMZLysyMhWGIoYNFpH75=
-2F8FXl69y5xhrVvnvuPaESOJLt8TXy0mcvho0KD4RNu1-2FzIO-2FHdAJdMti0tNSpIfRtfy8x=
ns8s7G095vDUKlgh6u8Njk0CGCA3XQt6QCjADrRIURWJqjJUbuB6RBlbd9ib8m5cVnHEEr6inhB=
cPpg4TEcR6vs38yYHmOUzZ3ZNmbqaee7yy1OFxxLUHWJwXsmrz5PfEN6cl0OUbUTPN8prIACiv0=
VGtLHoFIpjH8Oy9ikINP9Uwslqyzi7sj2296yQSxEld-2FqVh1MOcM2remt7guRvUjci9-2BPlN=
AkyYGXjsTP2znbs9kPnwWK061A4u8Tdkty4XonkXKMdkCIabFJKWwVD5mo91sla5hE4NZq2kBhU=
FWS30EzUiIpNJw-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"=
min-height:1px!important;width:1px!important;border-width:0!important;margi=
n-top:0!important;margin-bottom:0!important;margin-right:0!important;margin=
-left:0!important;padding-top:0!important;padding-bottom:0!important;paddin=
g-right:0!important;padding-left:0!important"></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5ff8d82f-2de5-4c53-b8bf-05e42e0fb128n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5ff8d82f-2de5-4c53-b8bf-05e42e0fb128n%40googlegroups.co=
m</a>.<br />

------=_Part_92931_673765517.1712874756516--

------=_Part_92930_1906138619.1712874756516--
