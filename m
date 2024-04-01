Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBCGXVKYAMGQEY3M446Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A865893B0B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:41:47 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-6144244c60csf34505187b3.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975305; x=1712580105; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KSnyBOQD56bBMT+2IsiU+uO23Utue02Kn9L+KM7ouFE=;
        b=Pspm/HOteFPDd2G+GZd7jQywvRZCwZ3i0DWGrRl8h/qKYfzGHZ9u1nhvbli7o2oyjX
         sINVQZQkIr3ltpKYG62HnIDzFm86ajnkwU5gDRkrXCfYmgnXzWWAWvL8YIQJqTAEvmbw
         2Q/g8UnlZo5gXMy+R4sTGhJE5jovVxiWTMyx08X4BvPe6Ukoj+CK2Bl6XcnilgdWgmRI
         y3++IA9uhhBsGOxkPGq+c8uipz4uLt4G1fXoWFr/4i+s8eLZSHNjPqh/hpfifWU2OAPH
         dnk4pJp2+16/2AJlMIj24NVWeZJAjDxaH7w6y/sQ/Ew3/PwNCkmxnGpTqSFsG1MpQKng
         9UnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975305; x=1712580105; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSnyBOQD56bBMT+2IsiU+uO23Utue02Kn9L+KM7ouFE=;
        b=NEHFt+tmuIn1QSpc7Y0g77ldYFarSIs0bNjIIoMpc3lmXngGfbWPoAOmoOzXCprh1I
         BhUr49qVo9RkfxOvce6SPoKKC49e7WU0wAQN/o4YnyApvCTbiOIe1Y8UA6j/SF0UqEYh
         vjG1AP23ROE6uvpaiaEBfWdiaJYS1nMCxmGqZFrNyBaMxow9im381Gm9pJ1Dgy+vuszH
         GC3o5z8X3UOGpNfpVq14tVSawILhuVXWpTjF4BN6X3tSlIJup52zpFmEFO60Bi4PRoz/
         ylxF+LICJCx7ubn92UzJiSTOdZHCffsnhoYsWybv/afnMxb8kZDSg54Wh2yfAhkQlGpX
         ejBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975305; x=1712580105;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KSnyBOQD56bBMT+2IsiU+uO23Utue02Kn9L+KM7ouFE=;
        b=n3uP0OL8HZDk9OSdCn2CogGkoku27HHbX1vK2pi9P+AHWCcNLFjdx0nPQkL+5ZBnJS
         zCHtaX0BO+66DTfHQ3h/YR57PsfBI0iFEptgfjQFBtCgld1saXR1IDlAhBEFiaxR0ZBy
         gYYxH/8Zemqwq23Svxh7MAfdy3DsH3iZTHq6BwXQ7laQJYHdxlzJ3z6sLx/SMawfUcBr
         ku75mUKBIDPNPY2ldovaqliMeU6mafDJ7EUArV91luMPOzAjyPzBwGplaF9vArs8ZOWX
         NAJseXXozLH+doCYP2EirkjVBNvnctxxSQauq6H92Hn+yDGeomuzaPQGbkB6Tiq7ZcIr
         qYEQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW8f4y9NJU+I0J8eBw4yhQ8Du9vc2Gm38B3GkwJNW3kG8dtgsXQgKf23fdA8xj5C7J075DxRHFobLU/VXgOLNa+w21y852czNp+SyA=
X-Gm-Message-State: AOJu0YwYcWCUahR7RFHWmpOQMQGi9KTh4YzOx0geesNRXAvpi0a/dGWk
	jQuXSxww91+aYmwOOXC0mUhRZ6KBudunHa7+YTw8DOqiq+NZkb4n
X-Google-Smtp-Source: AGHT+IH3z7T/wNaymE193/qo0NsUQKkcbvjPVq8YFA4S+TATAcws3Bio6ovibkejfOM23RvQJfDrhQ==
X-Received: by 2002:a5b:c81:0:b0:dcd:30f9:eb6d with SMTP id i1-20020a5b0c81000000b00dcd30f9eb6dmr6301401ybq.57.1711975305507;
        Mon, 01 Apr 2024 05:41:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:6907:0:b0:dcb:b370:7d0c with SMTP id e7-20020a256907000000b00dcbb3707d0cls2743947ybc.1.-pod-prod-02-us;
 Mon, 01 Apr 2024 05:41:44 -0700 (PDT)
X-Received: by 2002:a81:4ed6:0:b0:614:23a4:7b98 with SMTP id c205-20020a814ed6000000b0061423a47b98mr2217983ywb.4.1711975303844;
        Mon, 01 Apr 2024 05:41:43 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:41:42 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <efd29197-11fa-466c-9d65-57cddc65c104n@googlegroups.com>
In-Reply-To: <CAKwKV225wXqQy1Z=kR4wPib6m9xreB+=H4kQFTfaJPydUxuDSg@mail.gmail.com>
References: <CAKwKV225wXqQy1Z=kR4wPib6m9xreB+=H4kQFTfaJPydUxuDSg@mail.gmail.com>
Subject: Re: Join
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13372_839739658.1711975302920"
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

------=_Part_13372_839739658.1711975302920
Content-Type: multipart/alternative; 
	boundary="----=_Part_13373_894848287.1711975302920"

------=_Part_13373_894848287.1711975302920
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

On Sunday, March 10, 2024 at 7:45:09=E2=80=AFPM UTC+1 Stefan Brendjes wrote=
:

> Subscribe
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/efd29197-11fa-466c-9d65-57cddc65c104n%40googlegroups.com.

------=_Part_13373_894848287.1711975302920
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
 Sunday, March 10, 2024 at 7:45:09=E2=80=AFPM UTC+1 Stefan Brendjes wrote:<=
br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"a=
uto">Subscribe</div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/efd29197-11fa-466c-9d65-57cddc65c104n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/efd29197-11fa-466c-9d65-57cddc65c104n%40googlegroups.co=
m</a>.<br />

------=_Part_13373_894848287.1711975302920--

------=_Part_13372_839739658.1711975302920--
