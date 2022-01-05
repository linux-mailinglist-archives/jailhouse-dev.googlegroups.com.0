Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBMMY3CHAMGQEWTIEUJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 69366485A8D
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jan 2022 22:22:58 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id h12-20020adfa4cc000000b001a22dceda69sf184860wrb.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jan 2022 13:22:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641417778; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gku3iu2+gVS3bJeSDLg0DtWnjXYQNZWgY1a2nB+1fxtywxBQzCtv3f+yMQaPV1RMaZ
         N9UZUwLJJiejpNSmyMZNHne5/Qt/DMt1wTL8QkRmg1UMK0u03aNW//U6pWzn4xECspim
         ZQzeTNlQ7FcmA8LJqVqmTsCs971WWFlWiKQ0dhCg0OaIIY3xq8O/5Z9H354A/S7Q2mVp
         Jdg3trW0KbJo9/2LyTYkcc3PnKeWBOG2Wqy7PSO67NMZQCGZVBmf4FPNo9PXx9k+3sau
         coMdycAMw8hP8SlMCJyTBglA6s+n7ZAEwJ+bZnYD3cXNSOKw15g+kxUl0QYJAOcLF5UI
         lhGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=59ITYO16s1g0zoSL6wxkV5bQ+o3rLb+euyb4vOW6y3I=;
        b=XDnx8UgHWZw9R6d/Pda7S2/g8CSWsohZmzsv1HQndB7xU88RQTfFVtaC1hW2y7PBqR
         YgqaP/K+FYNasZD+UxSIijcaP+6IdPmCxP4cXGQrSRztOf5ofwQfyedMIpCHydiFPH/N
         DnFgHpmkeE7P30j17badFCYNiRCJa8YJPn+elnd9H4jAl3WEnLkDYzEosX7xwrVAe9P+
         vlZWApJZPqH6/WYwaIk2fwaJTYaqNvUbhUhVwsMxlimSwxUzsRKNFrQqgd932W3NrD4S
         K75nqyIMdN6AnswCDEP+BEEetFFT/ePehOjRW7gQph7Cobdhu0+GzOOXnskmEZ0c5iUN
         f4Jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELWLhjPM;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22c as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=59ITYO16s1g0zoSL6wxkV5bQ+o3rLb+euyb4vOW6y3I=;
        b=lljKOuBitf3XnWFmM7840Oy2cma0cPRkB3kgR0PKMVd8ckEjBclwNhADk0waOYCF3L
         Cwj9Q7YaVtLW1OhK+vsGVeTvkJUfXHijVEIybLtavl1NGVbwfz+r2XwWOgWOgfucLjZZ
         lzFALCyqr2TnEcKKRlWkY5Cb+yR8/YyChaZO49qRuaofl+CmilVIQWE4sNwu4DG78VV+
         OJzVWwyx+kN8qBzqDusIi4/DkUXO4VmiTjUw+s+O3+YwwfRvyp6lmQHOnALPPOUC0r+t
         fdwBDlfP0TB09iffpd2O1jfTxRlYMlviKzaq5wzdW7BH1GfX1wDKCjyCebio7RQAAHe2
         PCcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=59ITYO16s1g0zoSL6wxkV5bQ+o3rLb+euyb4vOW6y3I=;
        b=bQZWtAQ81r0Ek8aHWFzjJaEURd3oPt+i6rFIsSUwhykq/XRwRRBPVCbRp3M9tyO95g
         ICTlZP0giw9MCeV9uMVi/LV9Hjr3VldWwyj84EQqz60ZfcUloFsuA5JEkHvGNTyMJEJw
         u7JB0cclzAbVSkFlpnk0Wps/kXiLh6BOr+cXgWScHnPUJTywpqm5EASLGX1fxREYhcvD
         5/ss8NX4bFsDP/Jd4Sr2MVWQheK2FzXUeTHsNr+jXa8gvCHi5+xBnDMh5DkW6PWZ/PHr
         ofgwtCDhvOogl1xdq7CfUptYUov2bA+jsbd70/RQ71S9NONddnL9USfdAtxGS1e1FKd0
         ZcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=59ITYO16s1g0zoSL6wxkV5bQ+o3rLb+euyb4vOW6y3I=;
        b=ZWeX82UsYY1PJhZmAW6TrjfjHXrjQG4ZvM33CcSavFzXM7ILHygjCzZAFwdjjdlsrU
         C2Fskc25rzWqC6o1Y9gohzRNqvT9xiANDW84zNBBcwtuXo6jHDlb3mNl4lNzaCv/Kg07
         68QNAFeaWHXSiZaa3JBNn2P6u6mwfkfv/FWT0Dv+cJxixjKLzM0NFgYLVhXNP+rHSnxN
         4QCRXKkvo64hQuHF3JOIg2cGU7hXNzXm5qvwe8fBAHqSfwWFaLYZ9rkz/Rre5Igsoi1C
         NtphheiAJYWo3LEzBOv/8SqWTPFIuFRTD42/pU6viJV1w+eOLhra542OEUQAK7toYC1M
         f4Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qy+oSDfoVw5tqvns1zH/DTYiVAPMWmoXeHxOftJSVDsPun1o3
	orMtNesWheBGkcf+6YlMmfA=
X-Google-Smtp-Source: ABdhPJyMbITsYP90C4Vmrdgqfimsw3SOQmW3gxczXolNGVJWmF/eYdB1RQQRYlSN2r3ObPmplwQlyg==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr41913519wrr.123.1641417778004;
        Wed, 05 Jan 2022 13:22:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c27:: with SMTP id j39ls32961wms.2.gmail; Wed, 05
 Jan 2022 13:22:57 -0800 (PST)
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr4010309wmf.56.1641417776925;
        Wed, 05 Jan 2022 13:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641417776; cv=none;
        d=google.com; s=arc-20160816;
        b=FIn2M8/IZumCw/ZcTzYxUSd/2MGvwEa3lGXOBfUKcFLGFyyPhmxTJBKQAuRWRx259o
         RRHBduumSbGDxbF3IIpVyAmVV+pW3JMrsWezyGNA/ZsuCwCorOtlidf3TeJOnCDUhLHy
         gFhn2o6/TmUYsR8yg1rFPLw8zm+45CvHzRbIjIyD9hsExVpmzAMNmU6bFd5klEjjrvq4
         HMwerdx4OiCn/oP7T37dMJ3og1aHzMLnA0b1Ox0gMcK3G+rUj45Iybyw7jOs3usZ1dwK
         ZDODEzRxVH7AFzAU2HmwAxXE20DJYNn5IfqZ/LMgarpkwh/6Y2yYr0gnT5pEQPQ7ZQWI
         555w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qSci8cQeRncXsgpdbCs6pnmfUn3/lLAhkWFhHCGdtM8=;
        b=YhRuhGet4kdfwLtOhbJJGF2Hy7Ocnva+N/aZ5nua3mRfQXbufeXnB4GP/O6lZIsmHU
         zr5iAQbbN7DLCHENJ/RxpkgjIMb00qtFAERcMc4ZqlPwclpdZhbaHXhwNyHNPuTxfnKy
         W9qlsw5mTSNYnebG1aW9J7r8YWzvWCCouQvsOB6yqkkbKaHzZgIZOlGh/wiczcss8fcQ
         8s1/AyMsLIZkZV7jtup8gehhZdrKUB/bmgRsrtiRTUullxeiN4FLds+JPZEo2lDmOpgd
         dQpitycKiByaZ0kL0ACrjTre6XPCkYqkSJOm3OyoOpuN3XAZoCNGHtHmfWfhmKnH3ZCm
         wYlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELWLhjPM;
       spf=pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22c as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com. [2a00:1450:4864:20::22c])
        by gmr-mx.google.com with ESMTPS id l19si372453wms.3.2022.01.05.13.22.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 13:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of anmol.karan123@gmail.com designates 2a00:1450:4864:20::22c as permitted sender) client-ip=2a00:1450:4864:20::22c;
Received: by mail-lj1-x22c.google.com with SMTP id q8so872669ljp.9
        for <jailhouse-dev@googlegroups.com>; Wed, 05 Jan 2022 13:22:56 -0800 (PST)
X-Received: by 2002:a05:651c:12c6:: with SMTP id 6mr18490121lje.64.1641417776373;
 Wed, 05 Jan 2022 13:22:56 -0800 (PST)
MIME-Version: 1.0
References: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
 <7a34f1dd-243c-2df1-4bfa-b2b86faac8d9@siemens.com> <99945765-6ae6-4efb-9fd2-bc9a461414edn@googlegroups.com>
 <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
In-Reply-To: <04690e24-6aed-4856-aa81-f56f493821e0n@googlegroups.com>
From: Anmol <anmol.karan123@gmail.com>
Date: Thu, 6 Jan 2022 02:52:44 +0530
Message-ID: <CAC+yH-ZsR5AqLjCuK+y5ePczmiMK7upnkh3O+ppq8nEzC=j1TA@mail.gmail.com>
Subject: Re: Help Needed Regarding Virtio IVSHMEM
To: Moustafa Nofal <mustafa13e09940@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: anmol.karan123@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ELWLhjPM;       spf=pass
 (google.com: domain of anmol.karan123@gmail.com designates
 2a00:1450:4864:20::22c as permitted sender) smtp.mailfrom=anmol.karan123@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Moustafa,

I already added `CONFIG_UIO_IVSHMEM=y` in my kernel configuration and
can easily load `uio_ivshmem` on the target image.

Also, I am trying `virtio-ivshmem-console` so, is there any need for
`CONFIG_IVSHMEM_NET=y` to be added in the defconfig?


Thanks and regards,
Anmol



On Wed, Jan 5, 2022 at 11:06 PM Moustafa Nofal
<mustafa13e09940@gmail.com> wrote:
>
> Hi,
> I faced this problem on BCM2711 RPi4, my mistake was missing kernel configuration flags:
> CONFIG_IVSHMEM_NET=y
> CONFIG_UIO_IVSHMEM=y
> So, if they are missing from your configuration, I advise you to see the defconfig from jailhouse-images.
> Moustafa Noufale
>
> On Wednesday, 5 January 2022 at 16:49:32 UTC+1 anmol.k...@gmail.com wrote:
>>
>> Hi,
>>
>> Thank you for your response, that problem is now resolved, now I am facing this issue:
>>
>> When executing(after `modprobe uio_ivshmem`):
>> `
>> ``
>>
>> root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
>> ./virtio-ivshmem-console: cannot open /sys/class/uio/uio0/maps/map2/size: No such file or directory
>>
>> ```
>>
>> I am facing the above issue, please let me know how should I resolve this?
>>
>> Thanks and Regards,
>> Anmol
>> On Wednesday, December 15, 2021 at 2:57:18 PM UTC+5:30 j.kiszka...@gmail.com wrote:
>>>
>>> On 13.12.21 16:48, Anmol wrote:
>>> > Hi,
>>> >
>>> > I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(arm64)
>>> > board.
>>> >
>>> > Things I have prepared/setup:
>>> > -> Collected the patches of virtio-ivshmem from `queues/jailhouse-5.14`
>>> > and applied them to the `xilinx_rebase_v5.4`.
>>> >
>>> > These patches includes:
>>> >  - uio: Enable read-only mappings (with some modifications, as xilinx
>>> > `renamed uio.c -> uio_core.c & unified into uio.ko`)
>>> >         - WIP-ivshmem-Add-header-file
>>> >         - WIP-virtio-Add-virtio-over-ivshmem-transport-driver
>>> >         - WIP-uio-Add-driver-for-inter-VM-shared-memory-device
>>> >         - WIP-tools-Add-virtio-ivshmem-console-demo
>>> >         - WIP-tools-Add-virtio-ivshmem-block-demo
>>> >  - virtio: ivshmem: check peer_state early
>>> >
>>> > -> Cross-Compiled `virtio-ivshmem-{console, block}`.
>>> > -> Added common shared PCI devices to the root and non-root cell.
>>> > -> Root cell contains (`uio_ivshmem` driver)
>>> > -> I can see `/dev/uio0`.
>>> > -> Non-root cells contain (contain `virtio_ivshmem`).
>>> >
>>> > -> Also, after loading the jailhouse it's showing PCI devices I have added:
>>> >
>>> > ```
>>> > Adding virtual PCI device 00:0c.0 to cell "ZynqMP-ZCU102"
>>> > Adding virtual PCI device 00:0d.0 to cell "ZynqMP-ZCU102"
>>> >
>>> > ```
>>> >
>>> > After testing it, I am getting this(even after cross compiling the
>>> > application):,
>>> >
>>> > root:~# ./virtio-ivshmem-console /dev/uio0 disk.img
>>> > -sh: ./virtio-ivshmem-console: cannot execute binary file: Exec format error
>>> >
>>> > I am a little confused here, please let me know about anything I am missing.
>>> >
>>>
>>> Double-check with "file virtio-ivshmem-console" if that binary is really
>>> of the right type. Also use "ldd virtio-ivshmem-console" on the target
>>> to see if it lacks some dependencies there (due to mismatch in toolchains).
>>>
>>> Jan
>>>
>>> --
>>> Siemens AG, T RDA IOT
>>> Corporate Competence Center Embedded Linux
>
> --
> You received this message because you are subscribed to a topic in the Google Groups "Jailhouse" group.
> To unsubscribe from this topic, visit https://groups.google.com/d/topic/jailhouse-dev/TA_ZVlnBciU/unsubscribe.
> To unsubscribe from this group and all its topics, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04690e24-6aed-4856-aa81-f56f493821e0n%40googlegroups.com.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAC%2ByH-ZsR5AqLjCuK%2By5ePczmiMK7upnkh3O%2Bppq8nEzC%3Dj1TA%40mail.gmail.com.
