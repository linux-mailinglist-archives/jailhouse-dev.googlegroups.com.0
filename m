Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7NT5D5AKGQEFLYGZ5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 354F72645DB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 14:20:15 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id c194sf453064lfg.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 05:20:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599740414; cv=pass;
        d=google.com; s=arc-20160816;
        b=UiOxGprO//tMxzsVzIzdTVy0GorGHZ6NaS7zNwkhnDZ346ijshTq5OPAtBc+7+GTH+
         Ovk0HSSjbCSHrsQbzuqqVNmqqdt4BL5FNz1bR4waPx8sR/J8NWEzxGAKhNGVuVh56BSr
         VRhdBIFaD3SGfaN02tqa2Q+6AlEjYlyCCmdvNyhjp3bi4z2gcpDJh1ohwRD0UQln9GK9
         GHOvXBzBfuGXp3Vvf/Rl+TUHLKCB1AUj2tChpaHoBhvc5fxSO8h9g1hqrmVG9V2+PEgA
         VlCiyuLdRwVUx8NuvFYwkBaZphkWVZy6LomqIHoZrPU7RG3TcydB4xh6DKkA4bTDJL8u
         LYAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=u1lY4b1mW4J7y9Lbecy47kDEI7w7WDP1BW/pKmbfTNQ=;
        b=lLEr8+/gjz+5wawE1Z9RcVekgpqK2xhz/kckn88sLv5lsOb3JH5nzpMPE0q+4dQmpf
         KNyQep0vP4HHrpRdrXM9QNqap+uMHKA+ERM9NB4tiiFs0HlnbVJZUqVsah1ZBIwJiJq3
         8GYDE54SElirh0U6aZI01g71z2GiK3rHgumuB5mCrHKCZ6L8fBtZoa1xL56NLJPxoF2M
         ntE3lLaWB2hF9mBkWusAbeHe+kbMTR2sjArdWBZwMeGj0np/g8U7NhOik0mtmCwTJEyX
         o/9QinuXM2TJsxkT+OX15nklMQ1K5BVjeuhZ/oIanTbMg0I90GZJ+Se4q5hsZ1sWE3hm
         xTbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u1lY4b1mW4J7y9Lbecy47kDEI7w7WDP1BW/pKmbfTNQ=;
        b=isJt25xcFSLDakLon5pGdYOXcGvCyhGAqlMfddspEIuBEW0yPoOdYwv2K1j7ocOqui
         v6y4xPcNMpMKna+nEJkY1tLRrs2kMD216IzdVePVNeG/tclkAryICVMem72mH63jLWeI
         eOBdi/ZIIVxbjHv+Zfz/i5VBwCHAhJ8X9R3qyKgE3UxEsghbQ2PfDDnLFmYKqk9ykBWL
         EKQJg1Gaob7FtH2kSmdCKmxf8uU6Eiz3PEwAl7/D4t/4KWRC/zIJA/YooxnqN3k6p1mi
         PZt1tbCGt+taBWuCdwHHuGPYXe6X0DG8Q0lOM7JBHWlhPgKA7y6VUY9ygQbWc80Eec5C
         EMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u1lY4b1mW4J7y9Lbecy47kDEI7w7WDP1BW/pKmbfTNQ=;
        b=YtNARNGZGViS+3ohgi/q85ozSGHzENG2aNkBUiQQ+Vg7hrr3Pf2iUkzF/HBXVq6l5o
         UqCw/c6VKk1e5SeOqVcF8lbZMgKg8QiGKFHo4MK4xvgdPU5WgToLCXG8fEaPBs9UUgI/
         0W0Xvono7zojZjZf/e11DuE08OwiBZY2bOn8wZkN8d5T9H8TzUZP3VgOefmaMBnbi7Ir
         Yhwxe8M5hs/p3/jLI4gcSr9M9EF1VHDG/wHDnvTIaxLL6vZL7yDHFgOP9j015Ib19SF0
         8mZdVLQ/zEAsbhofwkm48n4bAvLvzUJpDIYYE6YIpS3To1iaxplQByi2pKU+h/F+FbJs
         cmPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533AVsnXst20SXscjJ/9dvs077nQO6QagHL2W7ORFD8jzGdhG+LE
	hnWT974LrTNM72Jwdkp9yoM=
X-Google-Smtp-Source: ABdhPJyiJM77treh1QQ9iD6KuWDYFV9VintZiJTVrZB7SP4i6pgViUVOv6XT8x7xMFoEENcy7Z0fVw==
X-Received: by 2002:a2e:9096:: with SMTP id l22mr4462231ljg.272.1599740414064;
        Thu, 10 Sep 2020 05:20:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c08:: with SMTP id x8ls1357243ljc.6.gmail; Thu, 10 Sep
 2020 05:20:12 -0700 (PDT)
X-Received: by 2002:a2e:a202:: with SMTP id h2mr4659085ljm.282.1599740412792;
        Thu, 10 Sep 2020 05:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599740412; cv=none;
        d=google.com; s=arc-20160816;
        b=v6IdteSwyGQeQR2g5zEiebHW3xVYgjbPGu37w79Tb2J+cxWMEPw7NrJ/Fjr2XcXauc
         czJE3b/U5XI+6NAswbBhDHq0CmkS9BYeHkOmpk9JpKXMfjfyXmNiap2JTFrVQKXDe6RV
         8YAIn2YkA37Kvl0SOED+oauFZdCb60Vu7xNNtZ1UmSMq9hvutHPGue6caFcAHP+mKEwF
         tQ0xJjxHPJQw94ggCitYGN0B2vhUxvpYGLxAbb+lPgtbGLYpCxf+RyDDQyuNo3pNfMUI
         ovMVkLAl0xYmVLW48+tIViY7+19rJSkenHtYvEBNMHwTMGK8w+M18QNeVUDvoB/zPHLj
         KjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=DjdAscglj9eo97E/j5P8UZN6z8mjntuA1ROmZJXROXg=;
        b=oy896exEbpy6GiPvUg9K+6LI0Rn8HG+XqN2M5ukJ08zgwcCR56+olRCq+M88dDTGYO
         5ch1j5ftxxNMGc4axFi+5o2qvnzEhi/I1XappUYWhxYOtbgJ7a4hWfkJHyWUvzDmk7Vd
         n9ZOqFGChwpzzWWRxmVry8VrL4BNNuAJiw04YuTtM5B4NNO/xrjUm/XY8Hr47tgXBjNe
         VrER9NhR5iKUDjrw6WQU/cZYMHGlThW3neGahddUjzLJViecWsyqyxLVCQ0/TGVA2yaR
         7hAm7WRaYPcpKkGkfjO/7Weyo76lbR0/j4/aXKQG8c0yFFHWWlpO/KzSP7cWVr244yb9
         ovjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m11si24389ljp.6.2020.09.10.05.20.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 05:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08ACKBeT021711
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2020 14:20:11 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08ACKBbc003307;
	Thu, 10 Sep 2020 14:20:11 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
 <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
 <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
 <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c9c32f69-572f-8224-8a10-e0922d7374bc@siemens.com>
Date: Thu, 10 Sep 2020 14:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 10.09.20 14:05, Jan-Marc Stranz wrote:
> I asked because I didn't get any messages from the serial port
> "/dev/ttyS0" while I'm executing "jailhouse enable ...".
>=20
> "dmesg | grep ttyS" gives me
> dw-apb-uart.0: ttyS0 at MMIO 0x9131e000 (irq =3D 43, base_baud =3D 115200=
)
> is a 16550A
>=20
> My root cell configuration contains this entry for "debug_console":
> .debug_console =3D {
> =C2=A0=C2=A0=C2=A0 .address =3D 0x9131e000,
> =C2=A0=C2=A0=C2=A0 .type =3D JAILHOUSE_CON_TYPE_8250,
> =C2=A0=C2=A0=C2=A0 .size =3D 0x1000,
> =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_CON_REGDIST_4,

Also with JAILHOUSE_CON_REGDIST_1?

Jan

> }
> (I've attached the root cell configuration file "q7al.c".)
>=20
> I've tested the serial port with "minicom" _before_ starting "jailhouse".
> On a connected Linux-PC with running "minicom" I get the transmitted
> characters.
>=20
> So it all seems fine.
>=20
> But I didn't get any message while I'm running "jailhouse enable ..."
> and the system freezes.
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/3752cf4d-64e6-4e55-b40d-0=
8800a689f0an%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/3752cf4d-64e6-4e55-b40d-=
08800a689f0an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c9c32f69-572f-8224-8a10-e0922d7374bc%40siemens.com.
