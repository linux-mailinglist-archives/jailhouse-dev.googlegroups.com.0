Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL4RWD6QKGQETKO4GAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E572AF57C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 16:52:16 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id u123sf924037wmu.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 07:52:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605109936; cv=pass;
        d=google.com; s=arc-20160816;
        b=eMZ35nkf7eYEbYQCCX5SR8x+uuLx7tbPxKBrv+rQx6uA7jRZpWYCEDeaQA6rgq34YC
         v+8wmT7n+o4MXIn/QYUj0iP+opNpoA8DGoyWMXityvARQ89AgvrkLqyhy6N+XdZzG0au
         r/ouFjlOUwoc8WjAKMJwC2VEqqyvdqrkKpPEluQZ/8C3Iis6TM5bpboGWwfnVe8EZFml
         XdgN3Ydg3fEMoQFna1ULP3Fy/QKf9OxHieqDB5+x/PCFl/6ot9SPBgsaojG66l7PecxL
         lUvls5ngFGHam9/Wvx/Brz0Nzn8AWLI67M1sqtwQhONYO/xGcPj4BFQuAeXm7U2hROXP
         Xd6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=QXvIFYtPM9JFah+CcsP2bXeX41szSwnKM9C0hbGZVCM=;
        b=fauc6atQGaiuqG93m4/Emv+FO2DIQ0va9PNgvjhEsGHxf8zAzvfvDJ1YHKPEs3G8pb
         2UXdOhJTHpfXoPXndR1nzjZCQnvZGkl8eD/uY1TieM8NDuIrznROqcR5mwlmYN3HHvyM
         D40tgRgAhD5fR1X3ZD1Bx0NTzR/ivmQi9Aap8XXlPTy/vQjEEDrYJncFXOKstFNRDhgU
         O5HiYLqLRLvW+Nh1kQ+T/y/eQA91ECJcveE1C4Oy90G4w96q9vS4e8yCmnUjmYf8iHds
         o60BDLEppozDRJebo4PrFmAQD+O3U+IDlX1EVXUp0v4KuDEZwFKtyJYhlWeTUS9fsZwD
         yk4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QXvIFYtPM9JFah+CcsP2bXeX41szSwnKM9C0hbGZVCM=;
        b=olmKXBel5pz2u2GvfgelnaLgAyFQk7588w7EvHxxhti7godv8FEXs1ya/pKwMwGrmp
         +E3S2x84gNC4FIPog2LfiTyYCZgI2KH9tcxZOFPUYqdlu+rXQq2hB3cEbCcxjgIg4gfl
         CckBekVxlNmygu3jkZbV8z5fNnKV7KtTRXuiUFZppBO2zsnOoKNLKBJ2w1IonR4K+vwV
         0C9Hg4775Ls/93g86KgySJiiq29KdxBs/TKN8lBm4kT6scpPFnVqgh1l7Hb6oKIhfg1A
         mo4T9qoPK/qbo75DqZef9Ucha3jo6u/9ZtEuhsx3rcTlzhhYLLOfsavjcZPnDem/wxd0
         fsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QXvIFYtPM9JFah+CcsP2bXeX41szSwnKM9C0hbGZVCM=;
        b=tYvF05IFGL2WO6RiGpaotebeZzPGKTHXGgxaF0tleRpAOQDvOim8e+yjC1UDPTBEeU
         Uwtc9i/olzz08MkZBbkibfVPV/+kLh/T9/qLWPiUABoW2ltCtgBfk/YoxRUtGba7t3eG
         MfYUUwP7s5+e5soXx7bTUr4g6t10hQzqN/rw5XOica7o0L/22TG0Dfxe4hyOxY4E7srL
         L7V0H5uQi1HTatEvvRUmHJDptY7oipGCTNcdB7l52dgRTP3uIrUr2PuuxmSv/KhX5qt+
         qN9u53fkPJTL4f9xcyV+U/o5TOkRIBPzmhTraMfUsIgYCdJVA6Ig055cBaDcFfqIWVAP
         51ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+AeqIgh1cac1ApFcVTUfukWT92GD+PJxY+Usjk7tL/96b0sAX
	TcGxbjrgF83R7NUOygYC/SQ=
X-Google-Smtp-Source: ABdhPJwb4tWWqbNgfqPZY23yac+26USIZlDVP6aRmUp24qAcKZpRw4EZfj+IvSD1JnFIAlS0WfSpFQ==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr18040622wrs.331.1605109936277;
        Wed, 11 Nov 2020 07:52:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:408a:: with SMTP id n132ls1499091wma.2.gmail; Wed, 11
 Nov 2020 07:52:15 -0800 (PST)
X-Received: by 2002:a1c:b387:: with SMTP id c129mr5084337wmf.66.1605109935109;
        Wed, 11 Nov 2020 07:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605109935; cv=none;
        d=google.com; s=arc-20160816;
        b=X5ytGdx6YzJRXkc4O2yEo93dOrrhOgCLJ0iAG792MT0o4pU3RFpAzFH6f0Z9vTsWB1
         yuft4jvTB2OW6v7I1bIBJwY97sCo2H8dXAK+3Cp5GXgCd6kv8YdKKsF6PKymkunYYDOv
         OUUQph91fqb9An8Mi2bTJ7aLYe90PEBTZzy2/gamsGWL0jlKulhrMJXDkH9BHAfEw7yX
         H6J0eeSdnbOY6sEuyoly1qq0UwtDA0AFglK6cqcHX83RaTjEwA10STnUgiyKV/ecXaGW
         2z1a8b/dh4kLak8npMws53lyyeEV6uXUql5v22zTVr4CYO3y9pISv0+r2YZGhojTIxs7
         C7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DJD1GyZy2QoWbgKka/9M0isvWUPgN3sHXjnSHyJMr2g=;
        b=q/sx4kzMpgtq5ORs7t84VPemOqv/vTmD7lXuyVkSMSGk3YgxFPh3zCeA6UIaEzkOGn
         JOf+OC9w2kGgkRTLqO7qn+Ihz1/ExBvd9RXJDvMAnB0RVW218atUnL1mUYscBuQzgTaq
         EBBxLk5zAhVjw4LWbYlUdBYhW30SywgEt83w2kAtegR8U0EAHenDwtMw6UE/gn+pN4iq
         VtK+EIiGrsmKc78vFLEq9fzlL2Kr9OPxcsDFR/0ekVFziQyEagtcqdKrAlIQWgpwwyb/
         T/eWfOszl0Wa7mrovhGHSXtyRZ3AJbsJPRcG24JThaOSAZ0PCpTTFBT5lT6XK07SCaIu
         8G9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z83si379767wmc.3.2020.11.11.07.52.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 07:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0ABFqE43028732
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Nov 2020 16:52:14 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0ABFqDWf023401;
	Wed, 11 Nov 2020 16:52:13 +0100
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
To: maple Chou <mapleelpam@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
 <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
 <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
 <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
 <CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f7cf4733-ad92-ae81-3d4c-acdffc81a57b@siemens.com>
Date: Wed, 11 Nov 2020 16:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 11.11.20 16:34, maple Chou wrote:
> "
> Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0.
> root@stratix10:~# cat /proc/iomem
> 01000000-7fffffff : System RAM
> =C2=A0 02080000-02eaffff : Kernel code
> =C2=A0 02eb0000-0309ffff : reserved
> =C2=A0 030a0000-031bbfff : Kernel data
> =C2=A0 79800000-7f7fffff : reserved
> =C2=A0 7fa30000-7fa34fff : reserved
> ff800000-ff801fff : ff800000.ethernet
> ff808000-ff808fff : ff808000.dwmmc0
> ff8d2000-ff8d20ff : ff8d2000.spi
> ff900000-ff9fffff : ff8d2000.spi
> ffb00000-ffb3ffff : ffb00000.usb
> ffc02000-ffc0201f : serial
> ffc02900-ffc029ff : ffc02900.i2c
> ffc03300-ffc033ff : ffc03300.gpio
> ffd00200-ffd002ff : ffd00200.watchdog
> ffd10000-ffd10fff : ffd10000.clock-controller
> ffd11000-ffd11fff : ffd11000.rstmgr
> ffda0000-ffda0fff : pdma@ffda0000
> =C2=A0 ffda0000-ffda0fff : ffda0000.pdma
> ffe00000-ffefffff : ffe00000.sram
> 180000000-1ffffffff : System RAM
> =C2=A0 1fae00000-1fb5fffff : reserved
> =C2=A0 1fb7fe000-1ff5fffff : reserved
> =C2=A0 1ff72d000-1ff78cfff : reserved
> =C2=A0 1ff78d000-1ff78dfff : reserved
> =C2=A0 1ff78e000-1ff7e5fff : reserved
> =C2=A0 1ff7e8000-1ff7e8fff : reserved
> =C2=A0 1ff7e9000-1ff7edfff : reserved
> =C2=A0 1ff7ee000-1ffffffff : reserved
> root@stratix10:~#
>=20

But you are using address 8,0000,0000 for loading the hypervisor. That
seems to like it's not backed by any RAM, is it?

> "
>=20
> and I'd reference this
> -=C2=A0https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v=
2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c
> <https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.0=
4/arch/arm/mach-socfpga/mmu-arm64_s10.c>

That seems to describe possible occupations - or die you really have 124
GB on your board?

Jan
--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f7cf4733-ad92-ae81-3d4c-acdffc81a57b%40siemens.com.
