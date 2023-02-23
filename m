Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB55Q32PQMGQEASDYPAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 212ED6A0E35
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Feb 2023 17:46:49 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fsf5457653wmc.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Feb 2023 08:46:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677170808; cv=pass;
        d=google.com; s=arc-20160816;
        b=jWIfr01sjPLQ3wkGklqRh9m2IrnCRsP7+ay7pPSeoRRbmbEVcOsj2ZRDW5tkKRaGXf
         8oNgNnN31giATU4yNm6eluCe0Zrb5YBFLssm89FInGTH6OM6KrRhPgbfLO1xWBfq79df
         nOwJSXtzh71pU89ZLtKMWBBiGPdN3CEaOU+r3KBFQuCpsSqa6uYfWaDNTOOg/OXEtpHS
         Zyi6Cn1XRKPPz+5kUVkzRn3BSdWgppPG5McTzsOxfCixpXJcCSKRSemykE7H5o+z2VTC
         crN7HoHWEKhWdcFAh1jP7qQtP/GpoZLrHr9v2gpc3pPoklCfpV2JrJuLvY268Ap5kNfM
         olNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=ViniP/pM5CjNfQWtNHp+HoOGCDoTZTj9wJToLGy2C9o=;
        b=FsjvRHGHvs7XSP8wfgUmafcFzRH7ZO1/3czT3B3EGGRDpLhLEUSsflkQP3T8LJ8Bg0
         MSiJkJbWiyftJNSgn8NRXAHQaUTQXqJkdIA2lRo9fd8wJ3iqfrn6rPR3bfyjjUmBkonW
         lemsezo7aegsQN1IbU5TZHN3lZ3xSO4xGha4CuPMpybs48qlW6CurNqENnJoNgp4nd6s
         wGjBhsdLQVR7xbgQZkuTNZSUREXDbZnS1/LCHF5fvHjRL4zJKb+vf3QUvbJmBOkb6ueD
         7tyUQiURy0a169M2jZLNGmwfyxAPsh2G8rohFPkspnAucmrJkXZnsQ5SqVO3ngKqo3rp
         AvCA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=UK2667RR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ViniP/pM5CjNfQWtNHp+HoOGCDoTZTj9wJToLGy2C9o=;
        b=tIk3kQUqRHgqY9i+PBYO/NDHNTJ9HKOLDi0nErZd9GXueldjQZtdeLdI2AIbHPn52l
         SuOt7TuMFlZcjq51FE4QPcsHYBkyD8GFi0pvJyfM4liQ9PZGIjdsBuoziBJ2NzPnbi+B
         IZjS89r9aVXZbUnl/RFOpAVr98KoqNSef1cRpn8+WweNUHoxBLHlGM/E2Ob9EgoEC8Ta
         Kbogi46GJ7Duvv9nDzVWNXuNcRNm4s1CRLHQ4uTczu2WJ+lBYAmNdV3S5dSGuG4gPYoZ
         AQR7i7BBYZ9cW0nQl713oApYJV3z4ZYs6MKW7uOjuP4cVxju+jj/65olc9zljEuItfRe
         Ni0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViniP/pM5CjNfQWtNHp+HoOGCDoTZTj9wJToLGy2C9o=;
        b=wTomJa0SjHhSI5ir+I5eFoN8RmxqN8A+RsayQuvDUyD4muZjpq5ckDzl9Tjaubgd7i
         5xnttflHItvEyTfWnwPJovQc8ynIwKXbJZPxwkOIFGBiUSUnITNoLURBNDiBdGHk8lB2
         ISUu5u4lPuC5SnkEKTU9FENj/kHr+aIhASJWcH2xPQr8TKmULU63alKS6UQKwJ8h92TS
         WG4xB0U5zKuA9jXIBoei5/Yg7vER2Y5g4QnXTyo/9ZXDYyXdBKREhRPSVfjIOJaO1zHR
         tCAo5Oz2Scg0SgFhwj0qC+SYyndnI6pHii+c8cJIR5FL03S3S/knmo/DeromcLVHvW5u
         YCcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWTIilo5xUKjVMLZWkHO577HmCuzv3CVF84cJowda36Nzkx3DLT
	1euogNT+KLnYJ9CAo883NCY=
X-Google-Smtp-Source: AK7set9acr8acTMGSc0HQ0acUEoi1all0xAyVhLLWchLwN4bMZ/htDrs2tc/NKj0qtwtpR27ulytjQ==
X-Received: by 2002:a05:600c:458d:b0:3e2:671:137d with SMTP id r13-20020a05600c458d00b003e20671137dmr2026492wmo.170.1677170808341;
        Thu, 23 Feb 2023 08:46:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:a18:b0:2c5:55ca:3a3b with SMTP id
 co24-20020a0560000a1800b002c555ca3a3bls415504wrb.1.-pod-prod-gmail; Thu, 23
 Feb 2023 08:46:46 -0800 (PST)
X-Received: by 2002:adf:f1c1:0:b0:2c5:598c:14b0 with SMTP id z1-20020adff1c1000000b002c5598c14b0mr9866247wro.20.1677170806663;
        Thu, 23 Feb 2023 08:46:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677170806; cv=none;
        d=google.com; s=arc-20160816;
        b=r9KyxxwaRTcb1yddjlSWIMtz/RJGKQ1CAJsv+m8UWKaK/FNzSimmcNlANba7hd+4ch
         m2ypihBFj9R28BhwQyiHnIVC2wrBJD0G/wyr4sJs1FF5EBxfYrSV5uktOwp4KlDcKsQS
         495q7RdGSHSwuNPmXWb+1nAvnUUIIm2uruABkv0Cryc2QO4mfvWag7XdKsZn4i/k1DCE
         eMEXH2uzXxehups2vB6licErjk1XqQI7XSraConC9WpkPHdXV4f2z3drewHlgvoyBnL3
         7Oun28n8SHr0605IhJug1Ixn47A2RfV2+HitO/6asLlbK+/YUANPwBHsLqnneqgX86sn
         Uc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VN2RQ++pEiTDcjzI02t5QocvUmpqFqzWzQWfpWfE2jA=;
        b=YSFWu5k1ywDhRaP8D92glZ2SoHgbfTKiK97YnY+RlSUOPLuv8XN5XsnZghdg2+QiYH
         eeU0A5qQIVkf7akxrqFGxnP5PcgCPenMx1c5J7oiRWrf++S+wLC5RdDDxjW1tUiXS2ID
         bMHx/FZcpGca76eH/pXckvrF8twSXiJVCS3nCBLIad7iQRwQh3HrSnDA6oomm6/U3Umw
         S4vSlEjPWmsyn99rauHM4QwpVW5E9chQkpOI/3Q/wJMeGiiWvlz6rc7DB4c1use9HE7H
         pC1xBACgqUQweXAw98XeBuvKUndYane1QlN5wAortQdgKOaBmC2CwfEIiwxQf3jdn7J+
         CMag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=UK2667RR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id cc13-20020a5d5c0d000000b002c6eaaaac82si411481wrb.7.2023.02.23.08.46.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 08:46:46 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4PMzSk0k2fzxsj;
	Thu, 23 Feb 2023 17:46:46 +0100 (CET)
Received: from [172.16.2.139] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 23 Feb
 2023 17:46:45 +0100
Message-ID: <751fa785-0438-dfdd-c5aa-86ccee76cb34@oth-regensburg.de>
Date: Thu, 23 Feb 2023 17:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Root cell "loses" the IP on the virtual network interface
Content-Language: en-US
To: Yelena Konyukh <ykonyukh@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <e647559a-49c2-4c8e-95bf-692b8495f9ban@googlegroups.com>
 <c7248484-26a9-b284-ad20-3ed41eacdc7e@oth-regensburg.de>
 <c2344328-236a-4ec8-b713-9b04df0735c1n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c2344328-236a-4ec8-b713-9b04df0735c1n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=UK2667RR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 23/02/2023 16:05, Yelena Konyukh wrote:
> Hi Ralf,
>=20
> Thank you very much for replying.
>=20
> Yes, my issue appears to be due to using "ifconfig".
> The IP does not get lost since I have configured the virtual network=20
> interface via a file in /etc/network/interfaces.d as below:
> /etc/network/interfaces.d# cat enP1p0s1
> allow-hotplug enP1p0s1
> iface enP1p0s1 inet static
> address 192.168.0.1
> netmask 255.255.255.0

Okay, and once the interface appears (i.e., when jailhouse is enabled),=20
the IP is set, and after you while, you loose it. Do I get that right?

Does dmesg give you any hints why the interface goes down? What about=20
the interface in the non-root cell? Do you have the same issue there?

Thanks
   Ralf

>=20
> Thank you agai.
>=20
> Best Regards,
>=20
> Yelena
>=20
> On Wednesday, February 22, 2023 at 3:27:10 PM UTC Ralf Ramsauer wrote:
>=20
>     Hi Yelena,
>=20
>     On 21/02/2023 18:23, Yelena Konyukh wrote:
>      >
>      > Hi All,
>      >
>      > I would be very grateful for any comments on the following issue:
>      >
>      > I run Jailhouse on an arm64 platform with Xilinx kernel. I use
>      > ivshmem-net driver and the relevant cells and .DTBs
>     configurations to
>      > support a virtual network interface in my root cell and my non-roo=
t
>      > Linux cell.
>      >
>      > Generally speaking, everything works quite well - the virtual
>     network
>      > interfaces communicate with each other and, once I have setup my
>     root
>      > cell, which also has a physical network interface, to act as a
>     router
>      > for my non-root Linux, my non-root cell has access to the
>     external network.
>      >
>      > However, I noticed that sometimes the IP which I setup on the root
>      > cell's virtual interface gets "lost". That is=C2=A0 - I assign an =
IP with
>      > ifconfig to the virtual NIC and after a period of time (sometimes =
it
>      > takes > 1 minute) the IP is no longer there. I keep re-setting
>     the IP
>      > and eventually it "sticks"...
>      > At some point I thought it is setting the IP on the root's NIC aft=
er
>      > netif_carrier_on() is invoked for the root's NIC that makes the IP
>      > "stick", but it now looks like it is not the case and I no longer
>     have
>      > any clue as to what causes the IP "stick".
>=20
>     Uhm, what distribution do you use for your root-cell?
>=20
>     Unless the NIC state doesn't change over time (which could explain th=
e
>     loss of the IP) it sounds to me like there is some Network
>     Configuration
>     Application that grabs the interface as soon as it exists and tries t=
o
>     reconfigure it. Then it maybe tries to DHCP on the interface and the =
IP
>     is lost. Something like NetworkManager, systemd-networkd, =E2=80=A6 I=
s there
>     any
>     of those applications running in your root cell?
>=20
>     Ralf
>=20
>      >
>      > Has anyone seen anything similar?
>      > Any comments would be very much appreciated.
>      >
>      > Thank you
>      >
>      > Best Regards,
>      >
>      > Yelena
>      >
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95=
bf-692b8495f9ban%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f=
9ban%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/e647559a-49c2-4c8e-95bf-692b8495f9ban%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/c2344328-236a-4ec8-b713-9=
b04df0735c1n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/c2344328-236a-4ec8-b713-9b04df0735c1n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/751fa785-0438-dfdd-c5aa-86ccee76cb34%40oth-regensburg.de.
