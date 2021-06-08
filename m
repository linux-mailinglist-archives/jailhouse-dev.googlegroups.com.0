Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBV5H7WCQMGQEKKAV57Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F80C39F4E5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 13:26:16 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id h10-20020a0cab0a0000b029020282c64ecfsf15268073qvb.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 04:26:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623151575; cv=pass;
        d=google.com; s=arc-20160816;
        b=s+tbygecCxD1hCKKSXDsy3moSlq6ezNGWZ+mgqOy7n80PgbHsyq2EjswqKlt3fsT8d
         P5flgCM7zg4navTVWjr/xqRC02XtdMI+N+2OQbiTiAZqxaGkSBAmKDS/jKb6nmp2lomD
         /Ams6zbS+a0/SckLdNpSC+aws2ktT301U1epzHSaySxXlIOt5kJJhWigNTtb8bVZtJZP
         WMDGHw44+bb3zjeJObFz4ke5RrlQogQqsAy1BgGyKTaGX1xO2IBjxeNQGcyfvaVaydrz
         NvrVlf3FWUlTXhJm9VYYkYfAb8bhU/Ni+CgXSmmslljtOOJ9PkR14pfwX/5TZAF6aYne
         Mzrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=reTT0+5pkaBvlHYBuXox50FfuSWKbPNQxC7mN9Cb+tk=;
        b=hUObXiFEhgxBzFbMkNWIlNXatFACn9pmNHdwrapVjFb6vtMPAnQyF8GkUWsQh7PzgF
         texBh7x0gR49DbmnlLUBjeR4Ao4au8P6cgKYokiZjQZ6MA8aM1SU5CnOm5cgVGBGnI76
         jqRedjk54O7DPSQ02sQezb/lF1SQGRyrANioK+bcZYm/EuBLEq5AhHxmfdxKjszxdOTc
         0nTzawm7U1/6VbMwMyaOu9YPzOkPXKEjQ+T5EBLcE+UCB/+YNUugo+RlurNEe7IGDzs1
         zWv/PvMI85gIug317cXdXbZn/MN2LzIZNGKLEegeiNlmUC9nL4NsdgUMrfRtILJAAqGC
         6zcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z+QmJJkQ;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f42 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=reTT0+5pkaBvlHYBuXox50FfuSWKbPNQxC7mN9Cb+tk=;
        b=FZfdh7pw63za+YTPvwUGRqmpPzReTBlVYx+18002dxtvlAIQTUJnzT4yGdJS0V94EQ
         4G/GljkfVbKmyZXRQ5j1o/aqxjA4QcfpQNq1VdPRuLNuFTz6wnYF2h9p0VnBgMZr1jE7
         tA4+g8MKIImH+JSDJDqODKVkJAWkbod+RdCCMHIb1JxyfUSe97RSJmL9ZHTaw2uDUOAW
         obpw42kvjaS4q2QO3HIHh0PI95y4hXh7GjPsjy9rHL1JDJs/qa9KWBMzkzO2mhOCdhsn
         9AuBkXWJCfdfS+8Jzapv0jwzU7NI1odQICQ2ZeJZPxi81oOhHgZZts9hlAEy9lq9htqw
         Fsqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=reTT0+5pkaBvlHYBuXox50FfuSWKbPNQxC7mN9Cb+tk=;
        b=lgmk0YcjXUO3ziVUC1qquC9oX73ufDuLVA2hxveMm9x4KYrdodOAb/UiM5BAwiJV9s
         XL/Evp3mhnpUCzu5sqrvlf/ceAbxHKxf9wgesCDCCNGIrPZ7LE5c2t0n3XA9iOUPsPJJ
         +OMv5RQU5+PQKtDP20vesMffBJ4QvodkvzZSa53Cyfv4VCB61q0cfEmReHZcWA58nJ8N
         IVNY5Rdx9hApRugk8H/2qbWOz5+lUYqXLcPBw/ooeqPqEX/Iru4xrU6eRotY9TMlvDlb
         hQ01fcq+/eoKEyCKSS1p/BDqQtWmLdl2yLcuEcj+fMzLIH9GErG8diurSjmhjlqytnXv
         merA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=reTT0+5pkaBvlHYBuXox50FfuSWKbPNQxC7mN9Cb+tk=;
        b=rulYKafumiN5XRNKVqARg1J/HKz9k1uKA98HpB8r8UoJKDLgciroreIE/L5TvRE8D3
         8OsHbQnSAxT8fo8NYYHHpXnR9BIf01k+NLkDF7NPz2+5uWwKK5CwnRFxv7jbfmdlCLbU
         uhJGZE4JEbpq3lpZz/nBVu+Hlu0f/3yVRZcnGoaz2KvewXPumNOz/jjBgELMs01EdzZW
         EebzPWpLr0ABvvMRdqOwb9jCY0KD4RBXj8ukLYZU1ggrWCSo5xhf/yWlijDLF/uQOODK
         390+2mgYiJlGJVEmktlN+Xi2V443dO6bAkvkiqSek8gQEY0SGzVoRCHJCJiaINqFMpH+
         r3zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WS2uhS+JPnhCTjc1nHRLkTQ8G9e7YpsowA7+ZMcqnYzePTgze
	18XjaVz705ph46f2ir53AwI=
X-Google-Smtp-Source: ABdhPJwCs0MJI5QUMtOPmUbxCR54QlJweYt4W4I0yyR0O4LPZun3WyZjlAecIWAGEKZu37mYRVXLCg==
X-Received: by 2002:a37:a1d5:: with SMTP id k204mr10949381qke.300.1623151575243;
        Tue, 08 Jun 2021 04:26:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:2087:: with SMTP id e7ls9198945qka.11.gmail; Tue,
 08 Jun 2021 04:26:14 -0700 (PDT)
X-Received: by 2002:a37:9701:: with SMTP id z1mr21077656qkd.253.1623151574832;
        Tue, 08 Jun 2021 04:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623151574; cv=none;
        d=google.com; s=arc-20160816;
        b=ezLPJLjwGP2Q+oT/IVc3je4/9+8nQUjgPukPCDM+09Eo238ee9RdQ9azCu1gRkvvX8
         zlB1JKrTbLu9z0SU0XE6t79JiUkeY4iWpY1u8+hVdktxErHsTd/0eL1D15ZOnzE9K40v
         45yk1VuEDt+fKI60U2A0AdKZwU4VQEZjSzeSHmwI9Sv/VeAW+ZZgH37Ax9I87z5TAT4q
         UW5FqPsP3j/Ht7rfRAMZyYfoa/4Z3gtXVksDQ1b4L9NCEuZ08+HWsD4cRz50oifZqK7r
         fyUwX6k6EvGLtfagDxRykOfvMT8/udaVU+4R3ZlUlf6R+ZQybKGcbmIOZvEEvLK6uy0E
         OPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Kn09TjXggXm1ykjWyZy5DI//BVw7kc4GXU6Kj97H/8=;
        b=txgwRC/3RlNlUCntuxWIlHn+7r2cCQHA37zpYEii1/oSRqTRD7Ynp04kXYMAkJg5ae
         n1jP/IdXrqxLKO8tJ75lntA+UmAQUQyeyJ0FeDRBuZFZgYzg+16DLdcfwFOTddkc+TsS
         4Yx4SCJ8KNsSXhl06qWj7/9+jUT+hmVCi2XyTlKaxTU3dUhZ1Ap660LW7BenFMc1nUU8
         97fbnWeOya+MECo9ATyFcUQV2k+EWyfOMPzcQpSIlU2t3zGbMQDzRSPaBw9ecIYa9M+E
         UejEMFfmUMjt1D8s6c4aqDMr2MS9Izj07+jzwZFZYkKxUBgdkmVPZOgU87Kg1FmRgJbj
         0/3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z+QmJJkQ;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f42 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com. [2607:f8b0:4864:20::f42])
        by gmr-mx.google.com with ESMTPS id d10si847917qtg.3.2021.06.08.04.26.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 04:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f42 as permitted sender) client-ip=2607:f8b0:4864:20::f42;
Received: by mail-qv1-xf42.google.com with SMTP id q6so10545948qvb.2
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Jun 2021 04:26:14 -0700 (PDT)
X-Received: by 2002:a0c:c587:: with SMTP id a7mr22634128qvj.59.1623151574698;
 Tue, 08 Jun 2021 04:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <CABSBigQATXq56FGPcsYaEhbPKAkfgW_q9j3ZcRPA8z-eK9v29g@mail.gmail.com>
 <f220116c-a666-5b73-9fe3-e5e4acd1583d@siemens.com>
In-Reply-To: <f220116c-a666-5b73-9fe3-e5e4acd1583d@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 8 Jun 2021 19:26:04 +0800
Message-ID: <CABSBigRR6qC2PU5hUE_HpLzBrn4Qn1=4j=V396ywRm4_u56A6A@mail.gmail.com>
Subject: Re: Private Per-CPU Data access issue
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, jan.kiszka@web.de, 
	gengdongjiu.gdj@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Z+QmJJkQ;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::f42
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Tue, 8 Jun 2021 at 18:53, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 08.06.21 11:20, Dongjiu Geng wrote:
> > Hi,
> >      From the jailhouse design, the Private Per-CPU data should be not
> > accessed by other CPUs except the current CPU.  But from the code[1]
> > and my test, it is not. For example, the CPU1 can access the CPU0's
> > private data, because hv_paging_structs already map it, and the
> > per-cpu page table will link the hv_paging_structs.  is this a bug=EF=
=BC=9F I
> > think the Private Per-CPU data should be not accessed by other CPUs
> > except the self CPU.
> >
> > [1]:       err =3D paging_create(&hv_paging_structs,
> >                             paging_hvirt2phys(&hypervisor_header),
> >                             system_config->hypervisor_memory.size,
> >                             (unsigned long)&hypervisor_header,
> >                             PAGE_DEFAULT_FLAGS,
> >                             PAGING_NON_COHERENT | PAGING_HUGE);
> >
>
> You are referring to
> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099=
f6eb9c657/hypervisor/paging.c#L678:
> Right, the initial mapping means everything is visible for all CPUs. But
> then comes
> https://github.com/siemens/jailhouse/blob/6d9c51d0bd819689c00f6a3c38d3099=
f6eb9c657/hypervisor/setup.c#L100
> which setups up an alternative mapping (installed by arch_cpu_init()).
> That does not contain the private data structs of the other CPUs. You
> should be able to confirm that AFTER initialization, e.g. on a first VM
> exit after setup.

Thanks very much for the answer, could you paste the code where it
removes the private data structs of the other CPUs? I do not find that
logic.  After enabling jailhouse hypervisor and returning to the first
VM0. the CPU0 still can access other CPU's private  data structs, as
shown in[1].

[1]:
@@ -261,8 +262,10 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_dat=
a)
                return error;
        }

-       if (master)
+       if (master) {
+              printk("10:
----------------------------------------------------------%lx----\n",
per_cpu(10)->id_aa64mmfr0);
                printk("Activating hypervisor\n");
+       }

>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigRR6qC2PU5hUE_HpLzBrn4Qn1%3D4j%3DV396ywRm4_u56A6A%40mai=
l.gmail.com.
