Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBVOTW75AKGQELMB6QZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279025882B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 08:27:35 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id a13sf161251oie.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 23:27:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598941654; cv=pass;
        d=google.com; s=arc-20160816;
        b=kex43e1EqU8S07E5iSJcaLYML5LwzshwIoUnNLcH1/zplU4LHIGp4NOqKvGe12BSGT
         SqiENzrF90OxGdji6K6gSRCzG/iy0vzv3/RNXR1hFMYtOGjhvLaav7WgBJCyPLibTYuC
         nlR/cQzP80OUvn7o6P82GRGw9dm0z6NkHmBEyWr+mENWXqrtCypRzcAajWMu4A7amuDW
         iMzKNeNrGTO7TtOwHZGsWhbZggA0EKhfDuR6/B8jkZz+xEH+k2/F4V6btxhva+YDSW6O
         uZ2A6lVTVlMxlSs6oo1rEPVjpm1jSW/GBFMRfiAV0EehSE9OQTOZ5W/CJKxCj2WA/16P
         OK1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=Kj24LmgCLOjioclXmlCeotSBo+Dupy10gUfnLaKS8Nc=;
        b=B8kdVUilzsNj9k6DuDykoXGBzhG6A0HT3R61a5gcJ9m53oiVQYwMOc3oznDGj/o6Du
         lm9f1rnnMPHRrO2+VkWErV5s5IbOvXBvqqvjPGB1IdP7l1rR6SmOPL5hrC/ffiJIkfon
         PnTV84BjwdDWrZJoBRAPcpTws0XOq62oHUjaPm7LsXvfSRaK9mowZliay2aviskLlB0X
         Q5bxxAAKfxg0z3+PJutMEJilC0e0S0bViSmucJq1VBBWZ048gKehcAifbUApRR1imUqH
         hm+X2WpxutnP0FK1zXVa73/W/LY36wkBSC+C0unXit6Yb64scOPuR2KBEwmdi+KcCwN+
         Ef/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b="NUCt/Ma5";
       spf=neutral (google.com: 2607:f8b0:4864:20::22a is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kj24LmgCLOjioclXmlCeotSBo+Dupy10gUfnLaKS8Nc=;
        b=jKr9uHN7DxnpRL/4RJz2c/J0eSApriIxddp/KaL7+p1PEYy5xr8LydddDyNKTjBtFq
         7XHxSiuI773qQ+6Ve50zD8AedAc7HmHfIh1I7Hw7D0P+odvjsNgzrKgqrdxwpb3qd1Fp
         rK8GcOVrZPM6q5sQNe6uPoxSzfX5GnYrkp2bpxgzPL2/3EgqZZe2bdQurkQ6vUndGVbJ
         78oBusQ0aNE03m62oGJeUmSHH2yZPOI6eW9XreuYLvR4rEugriOgsELVc0S0XQ+MZTiY
         Vuz5JoTlCOp6aaa8lXGi8LYneQyYu3qfexJ1DakhWnRRRwqlf7uePn0nN7Di1p1hO3eg
         NDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kj24LmgCLOjioclXmlCeotSBo+Dupy10gUfnLaKS8Nc=;
        b=ZSac8U3QG37/biXtISGHHca5HaG/VF8MsyxCJozpgmyHEudJeJTVdEdyV97xaFlWDJ
         q/euQvOmIYYKuFPnAuB0BXvvmcu6HSJmZPeq8lqLths2LsEkGqJ0CQTwFSUT5HpvdESf
         1iXl83WhI2b6LI/bkOxoF2ZFAT1xW6kwYXsZg7QZsD8HF3xEe05Z7Cieab76f+lfRu93
         m87bZicbeA+8XzO7wGXPr0SZYfCyloPmhp8tc5q8ijcuVJSr4FwJlzOTzat71tpKfv6T
         hs2zEVMe7pGpqGJig1Y5fadcw7xNZnQVuE4HJGuN+aZZ+sAuom40eJXOfHAciking3cX
         lyBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532yPwkQyiL1Tpk7b84SlZfUYF/qK6Ned31Hw/z16HMnBUoJQ2OG
	0Dh8K/pzIsUTCamBErupaSA=
X-Google-Smtp-Source: ABdhPJy2v5Qj8ff7tfzvuRn4kLYPxsvz0Vns/JpwtoJgv8TqFv1PfsIIFplRDLsuRYO+VZB6oRXx1w==
X-Received: by 2002:a4a:970c:: with SMTP id u12mr123517ooi.51.1598941653995;
        Mon, 31 Aug 2020 23:27:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:210a:: with SMTP id i10ls42994otc.4.gmail; Mon, 31
 Aug 2020 23:27:33 -0700 (PDT)
X-Received: by 2002:a05:6830:1209:: with SMTP id r9mr355877otp.206.1598941653224;
        Mon, 31 Aug 2020 23:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598941653; cv=none;
        d=google.com; s=arc-20160816;
        b=ukOwOYx4Kw8mfcI8j4S+41Al8zq15hdv1JldyQqvXXX66luAPfNkekz6Dxt6adQvCh
         EL4rGXDUdnXpEwHiFD8Y2+9SjX57u2jYspN/CSMs6EoP8FPxoSseYdTgad15zPKA5PlO
         zHW6Y4Wq9yjKXm2uCQ2GfnIcEXgCz0t8vjhwNqxlau1IoVl9s7GtYs6gqJM70s4PeRz6
         0nprqFzv066a+KGNirHqwNR7SCkR6Y0WVATOhJQeyYdUrq8q57RJlY+8zS68Hqw5Dz7O
         avKzzDkCb3Dh+GFeWGkHNdPmEJ/ZmxRTPLgltl/x9Gh6x8s56VaLZyj9JszLnnqQIzxW
         IGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sxolQ7AmLDSUfcS0tH7yCYYDjbQuOYNJGOR7rDRuKXg=;
        b=u9wq28i3E+a/OVJk4LcubvwzRA3xmVPvofDpej03WsximowaBGgacX9arOeraUq6Pk
         k025cJLs7BfKJeau9AvjcyvxWMtZ8xVYVrCuxFFy2Akg9CIUOhQlrNaQNV6iOLYySYl5
         Mpmbm6pKd6wicAVXPHQZG0Mxg1LDyZZdsYVZpG2gXSRyQIsCMkrwe0S5QLh0wGBNYLp1
         MOAyHKgS8zTyEWo46m00+Lb22drICVFFOMJ5rDpF4cpbwpY+zfFSNoL7dvB3bL5UItAQ
         hdfiTaLcrSUOXPCDbytMaSTI8YMZ+51gjfGmcu/kkVUYbQrNB+qn1e+RyGBGZCZj/Glg
         xoYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b="NUCt/Ma5";
       spf=neutral (google.com: 2607:f8b0:4864:20::22a is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com. [2607:f8b0:4864:20::22a])
        by gmr-mx.google.com with ESMTPS id d1si15207oom.0.2020.08.31.23.27.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 23:27:32 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::22a is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::22a;
Received: by mail-oi1-x22a.google.com with SMTP id e6so211323oii.4
        for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 23:27:32 -0700 (PDT)
X-Received: by 2002:aca:db42:: with SMTP id s63mr213888oig.4.1598941652497;
 Mon, 31 Aug 2020 23:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598871229.git.jan.kiszka@siemens.com> <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
 <46dbf0c0-68a1-7a62-8cc2-13a5b95d449c@siemens.com> <CAGdCPwvhkChVGGkr-fe=Q4WYEr2f1tQ0+GSHDnKRpfWWsYSp1A@mail.gmail.com>
 <a01043f1-4db6-dd1b-6730-4c9ee9e309f7@siemens.com> <ca0589ec-07b3-e577-1082-66d897022238@siemens.com>
In-Reply-To: <ca0589ec-07b3-e577-1082-66d897022238@siemens.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 1 Sep 2020 08:27:21 +0200
Message-ID: <CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ+W=m+06Nac6DMRp=6NQ@mail.gmail.com>
Subject: Re: [jh-images][PATCH 5/5] rpi-firmware: Switch to overlay-based RAM
 reservation to support all variants
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000036cb1c05ae3a9df7"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b="NUCt/Ma5";       spf=neutral (google.com: 2607:f8b0:4864:20::22a is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--00000000000036cb1c05ae3a9df7
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sep 2020 at 01:53, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> ...and that is because the RPi kernel is downstream, and it's
> dt-bindings are moving targets. As we pull the dtbs from the firmware
> repo and not from the kernel build, we need to keep both in sync. Sigh.
>
> We could more or less easily switch at least the main dtb to the kernel
> build, but we would still risk to break the overlays. Maybe I will try
> to align it all eventually, but for now the knowledge about the
> dependency may already help on next update.
>
>
I think it might be actually better to switch to the DTBs from the kernel
repo. The overlays are there (see arch/arm/boot/dts/overlays) and it's the
way how Yocto's meta-raspberrypi does it and it seems to work fine.


> >>
> >> By the way, for some reason the ivshmem-net is showing up as eth1 in the
> >> -next build and thus is not being configured automatically.
> >
> > That was fine here. I specifically tested this path as it exposed the
> > GICv2 bug in Jailhouse. Will double-check after updating the firmware.
> >
>
> RPi dropped the linux,pci-domain property from the physical pci host,
> and that made our vpci config incompatible, moving it to an unexpected
> domain. Fixed, please have a look at the v2 series I just sent.
>
>
Will take a look.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ%2BW%3Dm%2B06Nac6DMRp%3D6NQ%40mail.gmail.com.

--00000000000036cb1c05ae3a9df7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 1 Sep 2020 at 01:53, Jan Kiszka &=
lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">...and that is because the RPi kernel is downstream, and=
 it&#39;s<br>
dt-bindings are moving targets. As we pull the dtbs from the firmware<br>
repo and not from the kernel build, we need to keep both in sync. Sigh.<br>
<br>
We could more or less easily switch at least the main dtb to the kernel<br>
build, but we would still risk to break the overlays. Maybe I will try<br>
to align it all eventually, but for now the knowledge about the<br>
dependency may already help on next update.<br>
<br></blockquote><div><br>I think it might be actually better to switch to =
the DTBs from the kernel repo. The overlays are there (see arch/arm/boot/dt=
s/overlays) and it&#39;s the way how Yocto&#39;s=C2=A0meta-raspberrypi does=
 it and it seems to work fine.<br>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; By the way, for some reason the ivshmem-net is showing up as eth1 =
in the<br>
&gt;&gt; -next build and thus is not being configured automatically.<br>
&gt; <br>
&gt; That was fine here. I specifically tested this path as it exposed the<=
br>
&gt; GICv2 bug in Jailhouse. Will double-check after updating the firmware.=
<br>
&gt; <br>
<br>
RPi dropped the linux,pci-domain property from the physical pci host,<br>
and that made our vpci config incompatible, moving it to an unexpected<br>
domain. Fixed, please have a look at the v2 series I just sent.<br>
<br></blockquote><div>=C2=A0</div><div>Will take a look.<br>=C2=A0<br>Jakub=
</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ%2BW%3Dm%2B06Nac6D=
MRp%3D6NQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CAGdCPwsDoF-HSb_Lpx_mWw-DAqbwOWJ%2B=
W%3Dm%2B06Nac6DMRp%3D6NQ%40mail.gmail.com</a>.<br />

--00000000000036cb1c05ae3a9df7--
