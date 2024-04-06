Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB2FMY6YAMGQEHYEL4RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A189AD9E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:10:34 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dd169dd4183sf4371466276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445033; x=1713049833; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwZ7ZSzJdrn9Df+99vjbeeGYg/mlIT+bD9KMtgcw+6w=;
        b=cg22IjAgQL2Le0UKAKLY0elnbLCn0ZeuVsw1IiHBTu+DlVMf8r71gk/EKNlMljdV3G
         qYaJ6RWU1cO14R75gbO/TqMir017XLO3ZgIv25oJSNzynlntMuC5P6kwmLSC4xwmr4bW
         4PJbP2Q52ByqQzXGRd9ORHcfhaXAozFe8TYzQoHWrKRJGCKyAR1D5AjRpFyJKYI9wYrD
         stdvW66ybDzAXcdUyTqlravBeM+51Fp9ATHZ3tVZNS1I7J5mmLVUK5mbEm4UQpF6rEcQ
         07zunA6XGk651OvNkbG1cH/5B4UpgVdHzFJdutJ0U4NYuMBf0tYpykYXJCqF7RvSZzEn
         6j6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445033; x=1713049833; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwZ7ZSzJdrn9Df+99vjbeeGYg/mlIT+bD9KMtgcw+6w=;
        b=eeKFvZgyg+fN5GEmaTD/4u+QEP/QY+DEDq3Y+aXKex/9JCeekFa8bVgx0VuGrjT3Be
         cfvVXkUf67njhf5BAoJD8q96W3jfRZdR+jD2TqV6qTkgQ5cdWro+e84cVUDXjDUoLMF0
         JS4oXpE9XdlFDrcXJzPC2jlp9WrXImB3z9gdQtWWXEzU5dYgfjPhw6HuErY8Q+5Upe+M
         uVH5VudnGhQeWTR3w7r052Mv8HYjWPTOHhQ5VFbHLrm7k4XMQBH2/jlAHFuValfu+pfG
         5yC37wuNJDL/rPxw35wAbvtnOKNQM+NLFRCWJyBdlsVVmxmHjVTU5hOETcfUIhrnX6sS
         AfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445033; x=1713049833;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwZ7ZSzJdrn9Df+99vjbeeGYg/mlIT+bD9KMtgcw+6w=;
        b=F8VWYWITnD5qJrFIEMGEGtqaBogToiuuZvhfiht1UFW0vvxsu1JCGYahNFqXOVCBVG
         zYu7D7gssoWonKfq9v7KsbUw86t2iPXSdbtYBacuJXWDyPMkya1VwgUv237PyvixQoj8
         NsFHNqQRK9fK80xf1vm4PgdngW+VfJD78zk8tg14PpQHMI5X1ihk/kEXIPLHGeWQJFhz
         ltIkx/wQjdU8fOD8hZRlRhLgFkvRUP+4948uFTVgBj0elX5Lh1QhoXP2JJePVXSBSYQj
         ugi3wcczIWQr+SJzCwMhv/ci6yAI8AyZrZWpd/0sOFaJywxlgDUTPFuEva63nGRVCnPD
         jGzw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVYLYAyVxoHRKGrJ8LExZzKKNXLZA76MV7TSHYrJUQhUraKO1wLe4IPIqUN7ar/Lw3d/ZMmNvxkok1pEaYqlr4pvJzsXNN/D9Hkg2Y=
X-Gm-Message-State: AOJu0Yy3jJbGEY1NLevV0uL2cByLprS2Z1e+cpsK7FNG+xmXRp369p/s
	VsqpUPm5tDEodRxqITg5t4yqIcuuG8eNV+UA+BRlism0zLWTglvp
X-Google-Smtp-Source: AGHT+IEA2NN9C07GSUVr/Jnh+TJTZYIwG+5+rfRjdXVTjolTopVpVIO1NwUfsQDfTNQhE7mSECxXGw==
X-Received: by 2002:a25:d384:0:b0:dcd:1436:a4ce with SMTP id e126-20020a25d384000000b00dcd1436a4cemr4314865ybf.23.1712445033638;
        Sat, 06 Apr 2024 16:10:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:72c4:0:b0:dcc:8ecd:49fe with SMTP id n187-20020a2572c4000000b00dcc8ecd49fels1428441ybc.0.-pod-prod-02-us;
 Sat, 06 Apr 2024 16:10:32 -0700 (PDT)
X-Received: by 2002:a81:84c4:0:b0:617:cbc7:26f9 with SMTP id u187-20020a8184c4000000b00617cbc726f9mr1171680ywf.10.1712445032101;
        Sat, 06 Apr 2024 16:10:32 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:10:31 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d9a017ea-5d43-4b95-8f06-9ec6d3dee9cdn@googlegroups.com>
In-Reply-To: <CAOyhcX1uTF=HFPbwzAk=ZQBm6DCtPsHsd+DKBeZpLoZHo_SjPg@mail.gmail.com>
References: <CAOyhcX1uTF=HFPbwzAk=ZQBm6DCtPsHsd+DKBeZpLoZHo_SjPg@mail.gmail.com>
Subject: Re: From Mrs.Choi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_150528_1072510363.1712445031430"
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

------=_Part_150528_1072510363.1712445031430
Content-Type: multipart/alternative; 
	boundary="----=_Part_150529_1500620412.1712445031430"

------=_Part_150529_1500620412.1712445031430
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

On Thursday, February 8, 2024 at 2:22:02=E2=80=AFPM UTC+1 choi hang wrote:

> Hello Beloved
>
> Greetings to you in the name of the Lord. My name is Mrs.Choi Hang. There=
=20
> is something very important I want to discuss with you. I'm a very=20
> influential and wealthy woman but I'm sick and dying.
>
> I'm suffering from severe malignancy and have a few months to live. I am=
=20
> sending you this message because I want to make a donation to you for=20
> charity purposes in your country.
> Get back to me so I can send you more details about my donation.
>
> Warm Regards,
>
> Mrs.Choi Hang=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d9a017ea-5d43-4b95-8f06-9ec6d3dee9cdn%40googlegroups.com.

------=_Part_150529_1500620412.1712445031430
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
 Thursday, February 8, 2024 at 2:22:02=E2=80=AFPM UTC+1 choi hang wrote:<br=
/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"ltr=
">Hello Beloved<br><br>Greetings to you in the name of the Lord. My name is=
 Mrs.Choi Hang. There is something very important I want to discuss with yo=
u. I&#39;m a very influential and wealthy woman but I&#39;m sick and dying.=
<br><br>I&#39;m suffering from severe malignancy and have a few months to l=
ive. I am sending you this message because I want to make a donation to you=
 for charity purposes in your country.<br>Get back to me so I can send you =
more details about my donation.<br><br>Warm Regards,<br><br>Mrs.Choi Hang <=
/div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d9a017ea-5d43-4b95-8f06-9ec6d3dee9cdn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d9a017ea-5d43-4b95-8f06-9ec6d3dee9cdn%40googlegroups.co=
m</a>.<br />

------=_Part_150529_1500620412.1712445031430--

------=_Part_150528_1072510363.1712445031430--
