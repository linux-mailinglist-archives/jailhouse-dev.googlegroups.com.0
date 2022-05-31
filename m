Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB4WR3GKAMGQELBWTQKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3f.google.com (mail-oa1-x3f.google.com [IPv6:2001:4860:4864:20::3f])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C15396C4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 May 2022 21:13:55 +0200 (CEST)
Received: by mail-oa1-x3f.google.com with SMTP id 586e51a60fabf-f1e78da1a9sf9893186fac.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 May 2022 12:13:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654024434; cv=pass;
        d=google.com; s=arc-20160816;
        b=zkwoFq0scY/s51ZxRKJQzsrf4kDS0+Co1IXguY2RJZfVVUcdpHw0vY6TGph12vRdEw
         n9Lzw94nj7cirrCkw5KYezbNUwRQIHsey710mst3RV2LkPMBQFxjpvWtw/H8BQCtbngu
         t2liHoiAQT8BERXui1ua3KKKA7ZP99/SUFceGIQl/OocG7QMxGkuqLE9HaJCnZLaiQM8
         W4LzN04a4QjLVXe+9M3Ths0HndYd+yDmngbs/A7NIdn7Bcf3t/rh4lCwpMsqo5L+vu7p
         9NlnV92E3w28VvtO3GVbybKSHB0X40d3G1+NQwtP3Z5Rjgbiy/v+WqVAT3PN25XJAO6U
         ACvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=ItG2oK/ZKuV2z38NP7XRU+ohgHsmSZvxa17OWwcmN3E=;
        b=MNx8q3KFZ6hgZp/8ckLzQVBi3fEHkpKoM5lyKtusY7F9YtCVDj+D8eYHaZp5n0O+Uv
         fNGMtWYhj5sBKnba9zVz92k1HSqdLbiR/fhvPzd7z8OVTmjzGmyVG/3KBS/RtnH0JjXC
         EpoZtOrBnA8IL8hZlMx/cgmAKy5iSLZ+DRaJjzwfQv/HKQ3cPMcR2AnC/ID4eELdjc1D
         RJJBldGgjByhUldMiOQ8gFdi8EutkgZ7bF1CWYNY0iazL1dmUEDsvSZ8FE3jLmKS1RAx
         1f29vTNGZxVrZRQ1aKoAjB1Rf7/Nwv2T1m1zkvJNeL9gQIV9h/HRIk+6FHeP3TB92fYI
         zDRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpNfxYQx;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ItG2oK/ZKuV2z38NP7XRU+ohgHsmSZvxa17OWwcmN3E=;
        b=JwHk67y/D6wyrEWsNf262JauFhdi3u+MD358bPPTZ7b3TS0X0f0IJVa5jedxSvVYfL
         60Zr/ft+X+RHd137dACeo9tSENXJj8N0O1lby0IPjKiL7sPz2n7C/CLrHV/IzW1x+wcV
         5Ltenp4NQVsBhlw9ytQeg/XPiVKn6wBIu/UqZk7cuF52w6b2FSi/Rhl+ipyhAQdcwvFr
         dzEXbtox+NU19x48Ze0P5ZA5lX8q7AfK4BzZ9fddltqcQqWD+a7CwLB64qlQhmo0JzMH
         pR8G4QAP8ORGqNtFm/8e6+0QWQ/zDrG3xmdI+GrOXC48WmeE1mmIKfx4abbk6Fn8HcKD
         mt+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ItG2oK/ZKuV2z38NP7XRU+ohgHsmSZvxa17OWwcmN3E=;
        b=h63kRKSwzF9nd4Qr92KKbV+453IVzWVXXXzVHGTujnLN7TvHYqiUdBNUh9r4IA2UoJ
         hSIZLv1hFMdVnfkbXooZ6WV5UlJqvNGU8aRStO1J6GFaxB9hBuhZAUlCe/12dVz3JBk9
         4xPlJCuLH1+RuP5XOb1lVSCeXuw0VTyDP1fCKMliu+8PlZIzLaPnAWB/H6nLgxN6CsxZ
         tpFmQ9hOoUPrWBqccT1P9mZ71swbkbmmR7pKPgatr9fAXPXAjqxQaToTxM9T7SJPO9xt
         niZw+rlmoJGSVgahqcyglqEscBSS+RjfuyUHW5LgkDwMGVTjeo19MQs4pmEvbjD6ansa
         XlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ItG2oK/ZKuV2z38NP7XRU+ohgHsmSZvxa17OWwcmN3E=;
        b=mC462oogc8aA5GaPa9HUHP76yCl0H0TnP9r0diyepOhFMiuAqUroBv/T+eNOSk415Z
         PV0Yvqzt+Mn4nKGKs3kw0cr/s+PsJST50+sS/pqlXVg0fs8zMnW1fIYUewoNu/cCBKzR
         wjuO60JQ+JJ0XJtagydk4ElPo9p2qWC2eiBgeGnqe9cYgrNKZNgEeFrKTQrocLNXtUr5
         zLmvnc9rNwwRRdAvfb6XXBfgdXdd4PD8wsLJxOc7PB9UXc2AGOO0mve/5FsfDQ8h2mB5
         LfpJ82bBfpH/EePsup/8UdjUvckamoQrQV6lEcz6ZmdFFYFnVTl5iehMzbg0dwICHo+v
         NjHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dyZ9hfoopYBQa67mFOcjY9BJmFTl1cINsOvw4OraDt/IvMFVw
	9ZD6OA8VOsQt4IqOFVbHCSM=
X-Google-Smtp-Source: ABdhPJwqISq+W/zDBl/u7FvvXZTM4BcYfCeKCh69Y8/3uc6eWhNgyOBmGEyP/h7tsMUvtxv49Mcxhg==
X-Received: by 2002:a05:6808:f13:b0:32e:e25:f198 with SMTP id m19-20020a0568080f1300b0032e0e25f198mr1685248oiw.167.1654024434416;
        Tue, 31 May 2022 12:13:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:815:b0:60b:18ee:64dc with SMTP id
 r21-20020a056830081500b0060b18ee64dcls208580ots.3.gmail; Tue, 31 May 2022
 12:13:53 -0700 (PDT)
X-Received: by 2002:a9d:60d4:0:b0:60b:1936:26ab with SMTP id b20-20020a9d60d4000000b0060b193626abmr16325513otk.246.1654024433648;
        Tue, 31 May 2022 12:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654024433; cv=none;
        d=google.com; s=arc-20160816;
        b=IM9BcWap4egL57EKIJWAU94hDNu6c1Lv8Sq5ReNTpqXGcNtpdEpD73aoUgAzXDvfib
         7hTxGtdkzBhl6cYy7WeJBHdPFFr4fPXGvmGe+dBYh0aFsaarx6aktXjWtzhY407NiR8M
         ysqddS5HMRgcwHyoRBJNKGoTzf8mZh5IWkmJzam401V95+ogRCzlZKp6+4n+ik4wllaA
         mu6XSn6NJhUtHCSchY8PQvXmpGpNEObMaSG0a9trkNjf5R99lgMUm+8/BWoSP2ItuIjM
         3fpFDbiaZnJDsWu5JW+C6OG59JOMaxo8pnEpdSz9hPeBMi5Q31e6PIYXhsslzjLu1H1U
         o0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1yQYka0C+UQ5vfXO357xDXZatTbjoEpUJXyJ0gsd8AA=;
        b=ylp8SUdRfsRkQSNmKpBGhYdZnWm+TZYrPpHCRlqw6fRlrQAg2FyCyYTnnDC8EHOk5C
         PVjNlRIuLIP4x8gAnvk9L4c22J2+NvKssdm7I42j6COwnRyC8RdF444GTd800kRgSijM
         4/+TaHqDeFwnTirDAmgwUraYGvjQoC28wpyYQOUgZZ+WpI6EoSHW/96+HXri5T0jlb87
         vek5V0l78i/ZGmHFzyxjsF6SlkIg/MfJCB1nMVHUWoxZev6rLReYI9iGUZe0F5OjXQOX
         GPEaubhllU6o5OoNDYDpn7xH4oKw/0d6LsLloGG34o5ySJxTm9lEgb2bC5p/efDC8Bo7
         P9mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpNfxYQx;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com. [2607:f8b0:4864:20::1132])
        by gmr-mx.google.com with ESMTPS id le14-20020a0568700c0e00b000f5d73c60c3si155061oab.3.2022.05.31.12.13.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 12:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) client-ip=2607:f8b0:4864:20::1132;
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-30c1c9b9b6cso86203667b3.13
        for <jailhouse-dev@googlegroups.com>; Tue, 31 May 2022 12:13:53 -0700 (PDT)
X-Received: by 2002:a81:4f87:0:b0:30c:1fe0:f85a with SMTP id
 d129-20020a814f87000000b0030c1fe0f85amr18620715ywb.292.1654024433223; Tue, 31
 May 2022 12:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
In-Reply-To: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 31 May 2022 20:13:27 +0100
Message-ID: <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com>
Subject: Re: Linux imate unhandled read
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=hpNfxYQx;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Tue, May 31, 2022 at 1:52 PM Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:
>
>
<snip>
> * Looking at some of the linux inmate  configs there are two regions of RAM specified is this a strict requirement?
> * For the inmate RAM should the virt_start = CONFIG_INMATE_BASE?
>
After updating my memory layout, i.e. after creating one region for
loading the linux another for DDR RAM and lastly the communication
region in my inmate I no longer see the unhandled read error.

        /* linux-loader space */ {
            .phys_start = 0x59000000,
            .virt_start = 0x0,
            .size = 0x6400000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
        },
        /* RAM */ {
            .phys_start = 0x5F400000,
            .virt_start = 0x5F400000,
            .size = 0x19C00000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
                JAILHOUSE_MEM_LOADABLE,
        },
        /* communication region */ {
            .virt_start = 0x80000000,
            .size = 0x00001000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_COMM_REGION,
        },

I am able to load the linux on one of the CPUs but I cannot see any
console output on the serial.

root@hihope-rzg2m:~# jailhouse cell linux
renesas-r8a774a1-linux-demo.cell Image.gz -d
inmate-r8a774a1-hihope.dtb -c "clk_ignore_unused rootwait rw"
Started cell "renesas-r8a774a1-linux-demo"
root@hihope-rzg2m:~#
root@hihope-rzg2m:~# jailhouse cell list
ID      Name                    State             Assigned CPUs
   Failed CPUs
0       Renesas HopeRun HiHope RZ/G2Mrunning           0,2-5
1       renesas-r8a774a1-linux-demorunning           1
root@hihope-rzg2m:~#

Any pointers on debugging this? (jailhouse cell stat 1 doesn't seem to
updating the number so I assume it's panicked somewhere)

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uE2PzOF2mh0xEQmQ%3DakMTWXHy7usqEaM1C754DHS1%3D%2Bw%40mail.gmail.com.
