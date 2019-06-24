Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQE5YPUAKGQEVNR2KFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F650BDF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 15:23:13 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id g82sf550626wmg.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 06:23:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561382593; cv=pass;
        d=google.com; s=arc-20160816;
        b=dBjs+ksuG+muYtIDKj5HQUp0zQ7dFKs/7+746bGHWp6a+DZB9P/4u3FPioLOhoyWqc
         /Aaq+t9juOogwt7kOhlt5iO+Fh9N9B/aOHAwtQD56qT/tR/CFYPf3S+jrFHhUeMNvipZ
         11+vPcmuWajDlTNKls7jDNX67PFMWEwVaCWzRnjP2CRBKeDHv1XSbC1M9GVlERCxwm/M
         nr/5nf6QRRipoCykOIEVlADDOWyc8OgUH8/RAgsIOUY8/AoYE8HjIOcdMENUvuDEIYXU
         AXCWGX49dzG1GgAvtmBtdCPstAkIS6E5I8DDYQpV6VTdpns5pnpffpgqwtZC0iMkA2HU
         YnhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=IcoUE1zRdL9fvgvk7Lp4JHSyT9zqgsYcc97wgxuA1Q4=;
        b=SkAkn3Ee8593R/LRv8Ov0bso0FcxzblTM6LLDR/JO/xPFfATNmhDspN+1+dvUaqsr6
         IJb+oKNe/WVGAbi4lyeQsFAcpMsxgrkI68FfOVTrIUCR07Z3T7fbWuqo0ZNVh2JTdSAy
         tNKVMVXkj+ydj/NZPGtA0lEgeHmyhl9jf2dr9StmsIYvLF5UejSCeiE2eIDgrflxpg0X
         mf/uhHlEUE5C/yLt45Bzh7BxPW6S/slHJkF10goESGD4zpGdTvuvzVHhvlGAe357f1Zt
         sAUi9wXp8cP3dsSA+ILEKpeECYyYmOgrVktZEdgxMmGp+C0FQxE8Fhe+SrIAcZGgSJ6H
         pF8Q==
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
        bh=IcoUE1zRdL9fvgvk7Lp4JHSyT9zqgsYcc97wgxuA1Q4=;
        b=FZlW+IqnWGDo8AUsezlCYHlYWX/UQ5yd8uYbvFffVPc7c3K8hA7zcRNhnlRRhD2C5g
         IB903YiJMTLYN2nLdxYLyQei4V5/1DZ0ArLzsbzVl30PoTDIjqbshV6sfGlhS98CZqOS
         V1IjuQrS4fRq6bL09FeEro+E6V7UPAW1hgyvY5lDpN4ypDu/4hcpawktrvxUkzExXOU7
         oAHs84vR5BCI1XBUgmMrP6jKqHCbTpBTVWirIYq0ESyNibnkK0j+b5PQr2/EdvQ9Ubeh
         TKQSytskQZB5BfCB3FL16yvesv8434rd0qi7oeqZW5l9bMgLGQbPEuXWw3qeckF+i0Xy
         BAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IcoUE1zRdL9fvgvk7Lp4JHSyT9zqgsYcc97wgxuA1Q4=;
        b=L9D3C5snyDjygZbCeRhoXhxR4YqEZHrYq6wTsOxNTO/Ca3g1saJ61jq/pOdD9/W/+U
         vMlqRd2rqCcNF67GhfiWZlbdM1A6A5l0xpER5yizOjHtK+EY7aI1kw1HT7PmjtZPS9ky
         CEfKmuh70N3AdzTeHD7I9lGmEmL71ZHCHpH74bdxFeJSEgm4tPToJwesHX6R6boALHvT
         rMXfnNWUyKXTv5tb1MhRTa1X4XMUdS+mLY6fKwQEy8ZJvAbfc+gIwptLRCvmZg7iyVBs
         r06a+T5ghtlXTd1r0GS0sRY9g4lSEsJX7Rb/j76CbwUWun9lR8lRiQFSFHfX79jdgywC
         QcIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUfCeIlCVCsv9Kmp3u06KwOknrGpMJ3d0n8ggNdPp/ocGgpp4Cl
	R/LkRNeY3utOyocACAfed8E=
X-Google-Smtp-Source: APXvYqz6iwhYXwbp3dapilNWNjvqmmfOM5JsGIL7Ux/nkfpLlyatQyqAyu0YzAfLwD7X5XlaYn/vTA==
X-Received: by 2002:a1c:6c14:: with SMTP id h20mr16918913wmc.168.1561382592918;
        Mon, 24 Jun 2019 06:23:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:80a3:: with SMTP id 32ls3897177wrl.16.gmail; Mon, 24 Jun
 2019 06:23:10 -0700 (PDT)
X-Received: by 2002:adf:f181:: with SMTP id h1mr15341959wro.18.1561382590438;
        Mon, 24 Jun 2019 06:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561382590; cv=none;
        d=google.com; s=arc-20160816;
        b=tDJ1J/oR+/ojUTmQ42V0mGaFWRA2tbf2pU73MX5DaDNnPZPEwwItKP0v6AwFj7b3TO
         v2xG6bvj5PMQOVeAj4oUna35Scnq0BpJEPgHDEwtVtV6lXMt1/QWuTKN3+G+TubworXl
         5cU3hb13iYqBuCNt4cBkTM5Y1uPbrZOnH7NwXeendWE8BbpuWOyMqM8eE96oOngApNtj
         aIdhP7kYRf57XQ6KNZfSeYmY0DPX2jF7kTcvwaqjiBSEt0Uit+2jf1pa7x79FzQkYmCN
         hP+YThP9Kb26KydXybltmHoeir2Jpf+k7E7Z71BZxkS+6rjvmcN1fxIfTsJsW3mGnHIn
         ceXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=z6e7s1Cah+cg3rPEcvWeObHbJ4UCdOW3qtCu9dMD/Oc=;
        b=o8SZTZKpsR08kavapme82P3B+k6IJ0F82ft4f3zD6CEWrJSFxuKGpSNApQk5co3+Ix
         xR/disSNnx0olP+zuv81KoOCTlqrtyiQtLUBcunubqx8A7zn71RTGCmRzbZEErqdTJyf
         2UcidRrUT/VwNZkQfQTANHREfgWFFUOKbMLcV/vMShnHgiJdiw+BuV/3PiPAs+iznN/C
         aPfESfBQU5DAsRPdUTrdIsyWFMNp28SYgPpxOhw10PGU1//gcSNhH0QxtomOqHRo15Fz
         dnDaXBtyLvNJNBFl9fdoJ5cIVKZi5YjNJoFEBE6RBwjgvVRPWh+RxPyJ1NLizOZYtpho
         MBSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j4si893331wme.3.2019.06.24.06.23.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 06:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5ODN8vm003970
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 15:23:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5ODN8la031542;
	Mon, 24 Jun 2019 15:23:08 +0200
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
Date: Mon, 24 Jun 2019 15:23:07 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 24.06.19 14:27, Vitaly Andrianov wrote:
> Hi Jan, Ralf,
>=20
> On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
>> Hi Ralf,
>> Thanks you for the quick response.
>>
>=20
> [skip]
>=20
>>>>
>>>> so, I have to implement the corresponding am57xx_init() and
>>>> am57xx_cell_exit().
>>>>
>>>> Here is the old mach_cell_exit function, but many of the functions it
>>>> uses disappeared in the v0.10 version.
>>>>
>>>> void mach_cell_exit(struct cell *cell)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu=
_set) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_=
read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4)=
;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> }
>>>>
>=20
> I have implemented the am57xx unit. At the am57xx_cell_exit() I set cpu_o=
n_entry=20
> to omap5_secondary_hyp_startup() - physical address. That was in the work=
ing=20
> v0.8 mach_cell_exit().
> But I'm not sure what shall I do with the remaining 3 calls:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>=20
> When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu1 on=
line=20
> and it still in the hypervisor's WFI loop.
>=20
> Any advise?

Can you share the code?

But, again, we will likely need more redesign anyway because the previous=
=20
approach was already hacky. E.g. it was rather fishy to pass through the=20
WakeupGen page and issuing smc calls.

Can you describe the CPU boot flow from OS perspective, or refer to a=20
description? Back then, I implemented it via Linux reverse engineering.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
