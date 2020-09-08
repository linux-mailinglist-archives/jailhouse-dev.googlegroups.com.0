Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB26S335AKGQEVAZMJZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 389172613E1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 17:55:25 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id w38sf14013081ybi.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 08:55:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599580524; cv=pass;
        d=google.com; s=arc-20160816;
        b=zYYuu3EmK8FzPPsclK4YSNT6QK9gCa+uImj1ceIqRNtOTfB1vzSLIW4bbCDwt40Q1P
         j/WxtkuRQjbjeajPDEmgqgSAm6k0Rd91WsyCKA56M/8edBgRGgvVCvbEzueaPA8T9sWf
         Ht7yAzHsVo49ovc3TyOa+3tv2qVikwn4L2S6bprFbmgNiO4KcpvIcBegjUePhUJZRMCh
         fN18UgvuYoCLhk9Jng+WPD5VeWsUg1suh/TAjYFw/pnqDLi1SovJY4RGo/hK8wOGHE+m
         vuWAp6S4L3R6hkAI6NQbE786aoqzPG08rhoLmg6LN28dtW4RtvcBlEDE2py4OjaUauQw
         vnsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=3y1OdgH28mkbQorJYOgxylb87vBx+0Vv8mCg5IRuwO8=;
        b=aNNPI9XlibchiUkd4vt9nE5grUl8OBtkZC1iE70zx+UOoXzsEELXgKXjmelfKHbFTH
         ayR5XSAcypwdh9q3ra/625kq51QMCYjafKa7hY6s+lKs//UcXvIXpLH7vWxuyuG+OG3a
         mDiC/1yUiAVMFI7XC1VGNqTLy4an4QVNFSM3wm7jpmW1dnP3VgwSOIrKSvp4a9blKOF7
         PLfMhFA8FVIDOEySRN7a0JnzhqcOcD4LROikl9q3cmh7DPMJ33XlWHmkgmAq5c0T/yUt
         3t6JlDXSKkfbLFZAzbsc3hFBpjbvIiO09p/fxSGIwTaAy92sMU8tBEtsmr3tqAc3qMeB
         tb2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=bvGlIjZt;
       spf=neutral (google.com: 2607:f8b0:4864:20::c2b is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3y1OdgH28mkbQorJYOgxylb87vBx+0Vv8mCg5IRuwO8=;
        b=B72kVLGs/QpjWHKfYcAvLLvlomYgNc0HjGmPbqNync6w4uo9Mv4DRCeFY0TdwmjjoO
         JBPFnv8yE7heE1XIxGvdMVH+EVwXE02wC/NwxfYqXAH8ULTTTCsCBSbUvJqQ9ZS3s0bR
         Zjo8lXMlgWMgXXu58gO5G2NHq7d3ZeWGSMhsH4l3LNnbeWZBJ5qBK0uaPslLsQM2Tem+
         XvAFpVktZ7cVS1s851ADV3DFWI3zNhX0jQYOxl1huMEVUD2g7ZYMGEgPLWhsQN/Kekw4
         DN7aqn7zfWB0Pa9O8osdmiY7RpitgvPm/cO8g1ZqI0sonm34Gf8MCKl6+pvpVAfJQDqW
         S9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3y1OdgH28mkbQorJYOgxylb87vBx+0Vv8mCg5IRuwO8=;
        b=pHCuMqCHN1hudMy3T8IfExsBSKsiUnACDxxdZtbVs8W59N2UmI9XTyDE3gXe+DjZD6
         Sq/Gc9xKZnFlsRR3B3x2tW50svfsnJp1nxr8E5DQmkwWDBZsy+Zv65DGv2ZDN8ZEbQXx
         Y5g7bzBjSXC09ApfwtO0DWxBkU2WuZICxUaJJz7It9ygKTJZtN4oS0FTPKBTyqqLOmhN
         u3ETFayxY9vi7T3XdmmFkUeZ7hqpcRt1vZjDl8YEY110ZYJqQ4jSyFvrlkE9PcvpBYwB
         U9kwAIdqLn9Dxe3sQpo2tTqp7542iFl+wJViEj2ywhJLRNaMAls9udY0vSlKUiNpXL3v
         +0Vg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ILF9bBv0hkodSAqk+r2w6D9yzek+pWDii6FBSAUVKMVw2UVYV
	AJva0CcA2Ws5+B3tjZM/vqs=
X-Google-Smtp-Source: ABdhPJyKpkO058S3Oiu2zhbTPUyGxpBOMu1MPsPNMYeVdsV364nqfGIPxSsCzPB5otW/xi3mfuWNUA==
X-Received: by 2002:a25:338b:: with SMTP id z133mr466519ybz.54.1599580524256;
        Tue, 08 Sep 2020 08:55:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:68c4:: with SMTP id d187ls4257546ybc.1.gmail; Tue, 08
 Sep 2020 08:55:23 -0700 (PDT)
X-Received: by 2002:a25:ca85:: with SMTP id a127mr368293ybg.113.1599580523255;
        Tue, 08 Sep 2020 08:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599580523; cv=none;
        d=google.com; s=arc-20160816;
        b=oYnt379NPIwUs7gHd7XQox9+id25ZRSbHFdq4gvARLQOFz/pQlgoNOGcfZ0bOntk59
         j59/ziiyjW1DzQffvlbfB35FQGpTesmDc83xGkhkSR8q/mRAopUBr8/FA5FwbkZoJB5j
         bb15o6PfrGKK9zzWZCEl3xlhgjm42K7iCH4Up6kh5kszn3K8MeQlX204s8EvQh1MxjR7
         9GMf85WP2kJEBeTmm1Asxuz3vTnQKZmxzdjjSWGGHtn4NHlGYvfadELCCFrQuii8oYFt
         X+6y3C956Hd3G0AQH5t87kgUKnpu/793hIwfNjW6YPUqg4Kz8O80/cHxUer9rugZ7sJT
         xc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ydi8N3JHzcLRNXCy0VMAmjq5d8UhWWJJUt9zRPy0VjI=;
        b=Wk6TbHZq/AAQNVJ7aGqkuxHgm722kkg4KjpIBzQ9Ow9lWOidXgMLS581Z2AC17F1mp
         529WuXUdAQgKLNpJBpmMLflwWAf2pBwQTjA1x5lVHFzfJFYP5GVr1Qqqtrwa70/uNUcF
         n56VH21ibO1reDZ6vejw/uQB8ViBZYPV+qqUYUilbjskEURS4+qpblTP0ASOw0rTrk8A
         mKKMPvo9BBf3ze2Sb2oG+OBhEpaOkF326f3wQDmKnXVLQtpq6tpSI7mX9yTYNeiQu3yu
         FkghzyH+dNZjeOJCCQebW/7VBWqTi4X/q0MaiWxg9I4AF1AUI4fFbvuUNPDrBpX9W+TQ
         AHdg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=bvGlIjZt;
       spf=neutral (google.com: 2607:f8b0:4864:20::c2b is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com. [2607:f8b0:4864:20::c2b])
        by gmr-mx.google.com with ESMTPS id r7si1546785ybk.5.2020.09.08.08.55.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 08:55:22 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::c2b is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::c2b;
Received: by mail-oo1-xc2b.google.com with SMTP id g26so1025780ooa.9
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Sep 2020 08:55:22 -0700 (PDT)
X-Received: by 2002:a4a:d306:: with SMTP id g6mr18927874oos.25.1599580522198;
 Tue, 08 Sep 2020 08:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com> <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com> <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com> <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com> <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com> <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com> <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com> <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com> <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
 <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com> <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
In-Reply-To: <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Tue, 8 Sep 2020 17:55:11 +0200
Message-ID: <CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOnVU5srDqg@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d0c90b05aecf5c98"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=bvGlIjZt;       spf=neutral (google.com: 2607:f8b0:4864:20::c2b is
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

--000000000000d0c90b05aecf5c98
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sep 2020 at 17:29, Jan-Marc Stranz <stranzjanmarc@gmail.com>
wrote:

> So I still don't have "a booting setup for Jailhouse"!
>
> What do you mean exactly with "you will still need the Intel IOMMU
> parameters"?
> Do you mean the kernel configuration option "CONFIG_INTEL_IOMMU" or do you
> mean the kernel comand line entry " intel_iommu=on"?
>
> Why is the option "CONFIG_INTEL_IOMMU" not included in the configuration
> fragment "jailhouse.cfg", if this is required?
>
> I hope that at some point I will come to a system configuration that is
> useful for jailhouse.
> I am already using everything that is provided in the "meta-agl-devel"
> layer with regard to linux kernel and jailhouse.
>

That's my work. I created the jailhouse.cfg by comparing the configuration
I had in the AGL setup with the one from jailhouse-images. My goal was to
get it working on RPi4, so I might have skipped IOMMU-related stuff.
However, the configuration was working under QEMU on x86, but in the AGL
setup where it might have been set from elsewhere. I will check it with
pure Yocto and QEMU.

I haven't tested the Yocto layer on a physical (non-QEMU) machine, so
you're the pioneer here. I would generally recommend first trying to get
Jailhouse working in the jailhouse-images system to figure out the
Jailhouse stuff before using the Yocto layer. If you find out some missing
bits in the layer, let me know, I will fix that. By the way, the layer is
now on my GitHub [1] to prepare it for upstreaming. But there shouldn't be
any related difference from the one you have.

I'm not sure if the IOMMU will behave the same in QEMU and I don't have a
spare x86 machine to play with Jailhouse, so I can't test that.

[1] https://github.com/Limoto/meta-jailhouse

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOnVU5srDqg%40mail.gmail.com.

--000000000000d0c90b05aecf5c98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, 8 Sep 2020 at 17:29, Jan-Marc Str=
anz &lt;<a href=3D"mailto:stranzjanmarc@gmail.com">stranzjanmarc@gmail.com<=
/a>&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=
So I still don&#39;t have &quot;a booting setup for Jailhouse&quot;!<br></d=
iv><div><br></div><div>What do you mean exactly with &quot;you will still n=
eed the Intel IOMMU parameters&quot;?</div><div>Do you mean the kernel conf=
iguration option &quot;CONFIG_INTEL_IOMMU&quot; or do you mean the kernel c=
omand line entry &quot;
intel_iommu=3Don&quot;? <br></div><div><br></div><div>Why is the option &qu=
ot;CONFIG_INTEL_IOMMU&quot; not included in the configuration fragment &quo=
t;jailhouse.cfg&quot;,=20
<span><span> if this is required?</span></span>



</div><div><br></div><div>I hope that at some point I will come to a system=
 configuration that is useful for jailhouse.</div><div>I am already using e=
verything that is provided in the &quot;meta-agl-devel&quot; layer with reg=
ard to linux kernel and jailhouse.</div>
</blockquote></div><br clear=3D"all"><div>That&#39;s my work. I created the=
 jailhouse.cfg by comparing the configuration I had in the AGL setup with t=
he one from jailhouse-images. My goal was to get it working on RPi4, so I m=
ight=C2=A0have skipped IOMMU-related stuff. However, the configuration was =
working under QEMU on x86, but in the AGL setup where it might have been se=
t from elsewhere. I will check it with pure Yocto and QEMU.=C2=A0<br><br>I =
haven&#39;t tested the Yocto layer on a physical (non-QEMU) machine, so you=
&#39;re the pioneer here. I would generally recommend first trying to get J=
ailhouse working in the jailhouse-images system to figure out the Jailhouse=
 stuff before using the Yocto layer. If you find out some missing bits in t=
he layer, let me know, I will fix that. By the way, the layer is now on my =
GitHub [1] to prepare it for upstreaming. But there shouldn&#39;t be any re=
lated difference from the one you have.<br><br>I&#39;m not sure if the IOMM=
U will behave the same in QEMU and I don&#39;t have a spare x86 machine to =
play with Jailhouse, so I can&#39;t test that.<br><br></div>[1]=C2=A0<a hre=
f=3D"https://github.com/Limoto/meta-jailhouse">https://github.com/Limoto/me=
ta-jailhouse</a><br><br>Jakub</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOnVU5srDq=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOn=
VU5srDqg%40mail.gmail.com</a>.<br />

--000000000000d0c90b05aecf5c98--
