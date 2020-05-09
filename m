Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5MV3H2QKGQEO3GGJKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 521651CBE08
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 May 2020 08:17:26 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id r11sf1945992wrx.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 23:17:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589005046; cv=pass;
        d=google.com; s=arc-20160816;
        b=D09cyCrre8Nw9Ejp5DBvFqjSFyQ+hK/F4vZyo09sf2eaDYNIqzGBU6JVmsP3rWkD9s
         sS17SszWLG2bGF2QrVmdM0gDhkoZKWu95UjE0aM2H9rRhcAj6bthVlQHMlAqvlaLKyxn
         /xgSvfWRGRmfWZseQbJ0UIKRRw5wG2queqy29rb6135Wah456Ygj6VW2WgLICNaxZ+Ss
         2FdfQkxYRTliwsj+CGD3TbXmEJqCKJrBNOLQ4GNT8GfjigY4nvDilvKoG9hXNc3DsA8X
         ltA2jsmvuLl/DE5qxybLXXbkiUO/XiF4/8iju13yc3jLNRAAy+JQOEqChMSg0Jh/HUY9
         MLSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=om3zp/eBB7bd3SyZnMYGluwrLnTQPWoG0gaUMKQTJn8=;
        b=GOmrcu2hLC9x9Pg1KtcN5P3+LonTER4wgRqCbujaX33TUr/ubNrXbFXtEeiWCsb+xm
         EaU9bv3ZBpc6Mh26wXkmY1EdwXw1YmxQ/A1/GOYE27KkA3GgSq1Y8rhjwZP61tKXLVms
         1OVrwSb++vapCQvlS2Q9/QIcx4R2w7LKO7ve5KQmcXpC7txVU5pF/Y+LdqzuFL+pi11F
         U5KgH6fweRr/MPN+dQp+8Mswaqa0xkFa8eXWxTxr16CDk4GyvuEuGCjbRXYPesDN58fI
         a0QHiPmY0qxJ9CQjOJLYqWFjCn4+/88KI0w3/VDEN8VSh9iG64mK10oaX2I43BY5iV0I
         K0ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iyOblAFm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=om3zp/eBB7bd3SyZnMYGluwrLnTQPWoG0gaUMKQTJn8=;
        b=JHlFx7j/Lj2F69theoyswQMYYwPOBT9ohiB3zc+aXA0H2WA/XAPSKbPD0Ja115t+E0
         1ICe5PrXEvRr8Flr8fEKoceG5JeqEsLXwGrRNJBlapQHvtgvPcjsjwJ79eS4h5jsjcJr
         zOJjHs0kzrw4UuI3T5Bn+hZkB+vm7rpnAd82Sip1DBDV+OgKwF/jmcihlr3enPaHuIfF
         vP9dwvbkZP7mIiP1zguy5+qraAfNq5qU49tmpCgZq8cpUO12c9pmZdLpSmspNWeyy3B0
         j81MbOPfEVm3A1yyG0WnqnTwH5eBru4C+O2FfXCuQ6XUy2lFk98c14bkEe1dH66pZEph
         i9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=om3zp/eBB7bd3SyZnMYGluwrLnTQPWoG0gaUMKQTJn8=;
        b=S3zlHHw5Wa9YB63Iccsilx0XEgYv1cYPu2lg7DNZilxNLXx+n1QAlr2KFVPXEFsqOT
         qKhDesR9nCOtEnmeTrzKyId5NPpumNEN2aQ9u7K5sTHuzUbWwl+USurfsnmRlbXIoSdN
         n6YU5BQ5dlSQ+KYowCFagZRfT0meG//aYSVN1SgedXRbOXgRSX86Ef42LABQurnbNgXj
         CrSJlFGwB8/pbfkVCVjH+soJnBuoXu4qHSetSSGY5CreQM9/0KQajwrE2JVPOEvlexew
         XFWeYKSLYnlPs8zkDILmTwgKcKN1VKBAIcZIx3bfMDyjQtTwH4MBg8Vl92ve8wobOcuP
         RmEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pub8YOU55haJj1aES9Xkxm/8/1G0BmcPmrca2D1G3EhJWGEfM8d9
	q+mnF44i+YRGqZGAaTJu8XU=
X-Google-Smtp-Source: APiQypJdCT+FCxNwGsAwr4hiU4I/O6tTwgRk0P6OhNNMlvGpQzOYsYH4N7B74Do9sig5wC6Nlxestw==
X-Received: by 2002:adf:9447:: with SMTP id 65mr6901669wrq.331.1589005046028;
        Fri, 08 May 2020 23:17:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4088:: with SMTP id n130ls23204457wma.2.canary-gmail;
 Fri, 08 May 2020 23:17:25 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr13586817wme.128.1589005045464;
        Fri, 08 May 2020 23:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589005045; cv=none;
        d=google.com; s=arc-20160816;
        b=dnyFQBOL2a6jOReYhvMpc5UeWhyB3UY3dB5INxmyloe09VlkH9npJqCo9yjYEF8fIc
         m7/cZh8qdmbvdIjANQ0AuLkhYIAdjQwSKrMH6PgGYlrV2LHxsZiXE3w0/2hI5izwE/dw
         ukRTpAWbRo3oQ+Rs3Jn7Z2pXyIRRrj4LasfmxzWSSnRESNG11Z6fqFFbe+GryINpfoBt
         9QaNfX3cn8qlEgnh/lsUK0ojmr1szOh/tKJg7O97ySr20jHY4x84ahHjNQ2Daj4FYYD5
         +2dMQkkx8YIUzSe6wf07Sh/V5jEM05A9gsDbzvWm/lE1jdPuv0fw7bQPbD1tlGvMZI24
         m8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=wT+Y4wigyO/csvHms1VwlqIToPXHKWhUyZ0x1XsyIso=;
        b=0HeR5/xffrrIfYk5HSNErnuALAfIes0LL+OrJeOPInrVlMUBIrlIIvjK5gBxEBeiMK
         UXQLyrpxB3M+7kWCBQafFFo3xApvaJ5ZTq3Czmpc7bTvua1h/R39TsEkekKkkXLmkZvz
         bqthrdCz41FsdZObHBATSyBJKGZtBv12/nHDI5OHmwsLXvGI5BLV86sPFi0XXBqDR2Bb
         D1iFTOatN+EcVvVBOaxJUoJmI/WXDXAfwW5aL32jeh+i1ImYKh/aYA7TQQo8dh4VLzSr
         5rSKI7rezb7qYu3d9iB/dM1/HA0mF07/9O7AifDWUala1xQvoDWG+eOmUX4Zwo6RhXiC
         9slg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iyOblAFm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id s22si684598wme.0.2020.05.08.23.17.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 23:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MIN2h-1jY7cB1z0Z-004Anj; Sat, 09
 May 2020 08:17:24 +0200
Subject: Re: Ivshmem-2 driver for x86_64 root Linux
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <0fabe986-8e7d-4905-89af-75ec7e4d20ff@googlegroups.com>
 <39160e6e-2bba-a46a-5bc3-18595ec872a7@siemens.com>
 <7b537982-4415-44ba-a538-ffb599634633@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <68305c01-2b0c-182a-d92f-ef5ec9ecc205@web.de>
Date: Sat, 9 May 2020 08:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7b537982-4415-44ba-a538-ffb599634633@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5CkNxMYZAU2UbiZdrXe78H7u/Yh3Jn9LVEKGSYXqn/1tOOfEGWc
 zbAYCPSaWBm5F/9rTF3WqJ37HPgUMDDbeQrec/qyOg4IBPc9MD/zeMr/7ZLuq4Ft2sWnMbl
 pmc9MhObx3s6Ro/PwNP4fKq4dTE3QOTvszeg1qBebGwrJ23bSDHTzZwC0VujW96h1nSrC8M
 qVdfYAVzTR7oHR0HJU95w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CCw+EAnPHzk=:3jtKFL5PtbyiKf+196Vsta
 NV8NiaqcWSHJx224QpBoEcimT1nVDnFZvXZY6b7D04aA5mtchBQerhH0KjverDhGYsRZm67w4
 vMWDJKrqsfN52SOu/6T8+aIJ8Svz2TnEoRt6fG3md1lHKs5Gv/2NQ2GPa4KAVvzn+xXzQaXu1
 stuVnCvyfiIipK0Do6XZVI04CqjZsdtQi8zwGlmJisG90w1+P+7oKRpRLagIESA52ig28Kolz
 6V4rDcOmt/bUDcBx4uHvYbqeByMPXw9zzKhsuiZ4w/qvnDM58WfhcBWOq0nuQ3NymUtoLfBLc
 jYRE82OiMHkIZ+dPsOOOBi0IhnMNHj8FeUrw6jNGEcgPUH8OIdrBheNIiTFoZySw2nZw7VZxU
 ccByapWjSPTR3leUvJDmkNKDD6zPJSUGBe+zxpzw9qACjc5fRwhxqLZMXYzN7wYXYQ2cxUDwM
 aW3aiKwptIhYgFqw4n8wx2sWt9+kEhcKlYqD1mKKa5RoD2D1dUheAiy6yx4fEe5QF9Vb4xPkV
 REg/Xl3MAk4LBxKDFJQFj1v9FhgG40D89CHYY/zg11c/VOsQZvB0+zrtGEORIZa8OErgqXhkB
 rRVgla+vi9O/tOWzDdc815Jsd2BmjD2KWcyB9t+aJDuRLUhF48k+FqAyWB+PfcXrqBLppQh6x
 G1JCsqrvh03mlq715Dtl1AjOIOT/TDDfoFULQLdA69mAfEyCBtYClJrk0CO5tJxXrTwp0g413
 haU0vFhPsEzGnLfVw9lKSD5WOryxEj2cqKEB/+HwaCcABXlx/1vFjwi1PnGpo0dJtQZinQvND
 Z7mjS2cqHFtWvMhcGbjHrKdfD2HcVh8Bc0X8n+9eEXWTgLjOeK4Rp4IjKghhfBEQ5IAYuAHJr
 K7/anMTON55IzuL5S94hYfUrSBEdnpsK0kT0b1ajo4KYP4bC9c0K2iRFC+8EUf298e4GfufQj
 M6OaD3fhX1rVzowqTsFUOf/FVthLavFPDLXwrx5RKYaCwQeUmJ9RTHjDSgkjupvBbBwa9uL0x
 YgpBzqVLo4eyXVgYGGCgLytjKbexiHl3UVyP0NpOpeaSN0k1ROCsOyaOz2Df+EHtMmreOjE3Z
 EBDNiDf3rPKLxiUdZH0igj5NPSRpJcinIenJuRehmww5bALKOvez+p46nkB7iw2Ou7ifnax4e
 yvl/YFqfKMucQ6M2sPwJToE6AA9X+MWclIYL76FlkSlSoAGoIirAwM0XFkrUVzL0AUF58+zry
 vV3LhoZxCsGYGFjdD
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=iyOblAFm;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.20 06:36, Chung-Fan Yang wrote:
>
>      >
>      > I am curious that besides of the special ivshmem2 driver and
>     patches to
>      > uio, are there any other significant changes to the kernel source?
>      >
>
>     You can check the commits:
>      =C2=A0 - uio ivshmem driver
>      =C2=A0 - ivshmem-net driver (lots of commits in queues/jailhouse, fo=
lded in
>      =C2=A0 =C2=A0 stable)
>      =C2=A0 - virtio-over-ivshmem (experimental, only in queues/jailhouse=
 so
>     far)
>      =C2=A0 - driver for debug console (only relevant for bring-ups)
>      =C2=A0 - some export-symbols, not needed with kallsyms workaround (a=
s
>     long as
>      =C2=A0 =C2=A0 that works)
>      =C2=A0 - some dts changes for marvell arm64 boards
>
>      > Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx
>     and it
>      > works like a charm without any noticeable bugs.
>      >
>
>     It depends on the use case what would be missing, but things generall=
y
>     work. At least booting.
>
>
> Thanks for the information.
>
> Now I know how to port my old modified ivshmem driver now.
>
> I am on x86_64 so I think I am good using the stock kernel with
> separately compiled driver.
>
> One more question,
>
> As long as my user-space program don't write to the readonly region and
> trigger a fault in the hypervisor.
>
> Without the uio readonly patch, things should work correctly, yes?
>

Yes, provided you modify the uio_ivshmem driver to not make use to the
readonly flag.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/68305c01-2b0c-182a-d92f-ef5ec9ecc205%40web.de.
