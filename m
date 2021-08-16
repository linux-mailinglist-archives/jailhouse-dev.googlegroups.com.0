Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBBWS5GEAMGQE3OIBJNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x938.google.com (mail-ua1-x938.google.com [IPv6:2607:f8b0:4864:20::938])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D663ED73D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Aug 2021 15:32:56 +0200 (CEST)
Received: by mail-ua1-x938.google.com with SMTP id f4-20020ab06344000000b002ab9c37b49asf2837012uap.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Aug 2021 06:32:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629120775; cv=pass;
        d=google.com; s=arc-20160816;
        b=xpvlqETwrf98/BP1bNLxVhETFWRDF8mLEjIfasm9C5lcADf8YteV9KmnAbzkSDXXSV
         JeMPAoooJKbmET2+qAtXovZSUbw/rS4TxcpAwf/ElZAWyajbY8FfCN98wA/1jNwZZZQ3
         hiPdP8nSJpJZqcCDprBQdOVeqZ88bP9MCmCXVH03YjSzV1u20iIbObALCOLItcUeiX+5
         0I9I8g0zlSBCuuxKXl2WkTwJNAQP6HZdrZ/vw5Ij2boShwinXgWBbATZEF2rxRs3b421
         c0n6Rniu+Q0/hSjEUM+OJbtbDRO1p3oEWu45SF4KKeTEEHgoC98Yq60tEVP1mH4vwS0m
         vB3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=gMDafP1aytU+AJiU7VlVxE/7Y4DK0pP0kzCuTkCbl3k=;
        b=BCvXBwBtkGTDsm7LSC1IxcTuQTC6tjrl1s7x+tREDvhC9EsyPAxCv1XKac2D54Pbj5
         znG2bINCKYDM5Hr35U8hXYlKqcjF3Hhw3C7RVMnvZcA2hdXIxUgGInSJfzUxtwTSwlqn
         MovhQqeLfjam/HdcBk8Mq4rE90yVUOUf40WPjzCViB6gd3FHqz/4orC2G3ZeqUsbwpdO
         7mIh5Yq0t12jm2hW8+gLMO0slikJPOMnKTF54Y1fcs6b/1EPRsqAYgTTqnOKfXvwaSJ0
         KMVEBjdUhph5WsvolWTQE8apWg6ZXT2Un3/1js0IiVsRUoCt516sI5iaOnb915Iktaob
         Cbag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMnqtrxI;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gMDafP1aytU+AJiU7VlVxE/7Y4DK0pP0kzCuTkCbl3k=;
        b=jj85E72jnyOQV/4oGNp+keMz7fZTsBwctEJcMYyfR7iv0HrOGLcUcuWseaskxBQ4Ww
         vAMnL/tGRLcKXVgpVJoITxH8ygKAZDSVDZcGvwxnVTnCcaFbvqONPQqTAvGCUY7wD6ve
         BpIWKwm6wnU1ReBP96QCfbBX9nYHK30uJrhIXq5JyBiFQUP60oj0jrLc72ATo7HlFvd+
         MQK9OzKR+msMe7VTaiOdBnD8BMs04wYDUFSPChJdFaD339+NoKPybYxJeVxSBuyBiI3l
         unapvdRs3BPu06egvXRQyFKctJwiHNZBjz4s1gno/iq9V449AOfecgvzaqcFqoBSjYkb
         F+ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gMDafP1aytU+AJiU7VlVxE/7Y4DK0pP0kzCuTkCbl3k=;
        b=cN1V7xskHEao1O9QV0Avq9WIFisXiOYe6S+SKhi6T4Esm3Zw0YjDSj/xKXTqxzc7Rq
         LIKGqXiRQMNp8WZbtV7mFlZYzW+LfEUFQ5yH6j8ugoy/q8jCCxkMmMdArRzl8Iu0T/ah
         vsl609HAUn6qD7RXi0iFTcSpmkt55FNZaOJUVLYOfKMfBm9NGtKtQNdjn3OcbX0cmhGC
         Yn/eccMsjHgnYAX0yhJ3EfFboDCym6BvIG8xMwC1Y1CDcoY9kG/ipxXLzZUBYh8yzUmj
         VWDnva5V+w/sul1R1FMFPEPzVnTmilY02/og+54Zb3/LuEMZlKEJxSkq15mOrhqsJILa
         HS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gMDafP1aytU+AJiU7VlVxE/7Y4DK0pP0kzCuTkCbl3k=;
        b=fS5cebaqvhJ+1ATu+ZXgqZadiTai3jDcOTOok3o+iVOAjyck7p3Dt4ZAjZqpRe7TWg
         piXYbsLzcnUi/cteSjroTFSNXf1RsvKa0zcqf1m2LjMNOvx0sIiqoyBThRR6CbteWHLg
         NMWeJ70o71wMlWyv/WxHMwEdjpo1ryeswCjTHUoNMcls/e1INz91TNvOoY0c3Ac1egzC
         Nt2RuQhKBLe4r6oT0tqRJPOWQbNywMiql7piAZcEhSAcFyywvbdV6kuer/bmCoCx6VyG
         tnvPX3JwoBUhf51VfGwFmpdHGi/Wi9AgJq8ksOtMggVxFto6DDC8NEQEODvJnYFZq+tY
         OrQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Rr7H5mWtw5wGfcS8G5WyIPRN+dUXjIM4+AV8nFqNaizPH2zmO
	Z054/2ZiNQzH6/8ke+Z5k9M=
X-Google-Smtp-Source: ABdhPJzbFaab815bNSJOGMFoQmanSkf+ztUpHdbJm2gmEb9aLdDv3ViYNJL5QyYtSTdusi2aD0HzHw==
X-Received: by 2002:a05:6102:25a:: with SMTP id a26mr9643412vsq.15.1629120774317;
        Mon, 16 Aug 2021 06:32:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:338e:: with SMTP id z136ls1357855vsz.2.gmail; Mon, 16
 Aug 2021 06:32:53 -0700 (PDT)
X-Received: by 2002:a05:6102:18f:: with SMTP id r15mr9663942vsq.49.1629120773734;
        Mon, 16 Aug 2021 06:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629120773; cv=none;
        d=google.com; s=arc-20160816;
        b=U2+r8C53s6WS4HVXphXfqdQrtBsgLBbxxFKS9Y/5ZdeJY0KfmAIjcf1JD933tr5JgH
         jJ4sGLn7WaDV5yQSNoXdoMd+w61d2I2aC6DWGSe0sESHMPigPT8ufT5FcdUY5J/jPThH
         MJ9ChYv5yM821d8CUh9012FaKOE6Daio/CIk4c+iCtZ7TdTcHRoAmpPTZRWMLaA4v52d
         pEVQHCCHhUpogsJV265u7l0K/dAvE3MyFKOnpxfChu6aMf7Hr2N0JHogU18flpwuSzdw
         u0D5gqT8SBjwBRPcLBAXrm9aSmDI6+O/KfAKixGyoYP+FLxvgPUXCfD8UCADs8/obRRW
         OO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AeM/LuMhhagI6nAJYfpGj4wGKhbS+m3YC3JJqdqoI80=;
        b=cpbind1NKAha8RDF71Jkm/dH7HOrIr99PDtxuhcr3c53aQWccjOvLTTaIYx5cxdlOP
         5a+angjzgQOMl1Y5Pq8cL/5zBPKck1VoZNC4t7gRm/IWPnhlLAjOja4fuUaR89FciNst
         Bx3Ojj0aG6WXeWdYU53CUoQjV3XNVK1WqmzrMWzfCKEp4hT58V8GShIuEAZBWxcyYosC
         ChCpLRhGuZZY7+mINnNQyEswmjRPG7fldU8XbY4mXjV7SDzQIl3Bovr8Hf2sc0Ou7dPI
         z3SHn9OUpQh5br2HaxX+VUm3t+wTxTbYvMsJoMQ6wAqWD/IbTqxw/cpOJU6fCmAcmBG/
         rn9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sMnqtrxI;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com. [2607:f8b0:4864:20::743])
        by gmr-mx.google.com with ESMTPS id c5si200651vkg.4.2021.08.16.06.32.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 06:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743 as permitted sender) client-ip=2607:f8b0:4864:20::743;
Received: by mail-qk1-x743.google.com with SMTP id m21so1146562qkm.13
        for <jailhouse-dev@googlegroups.com>; Mon, 16 Aug 2021 06:32:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1671:: with SMTP id d17mr5761423qko.191.1629120773522;
 Mon, 16 Aug 2021 06:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210814135557.13135-1-gengdongjiu1@gmail.com> <5e9b29de-b93c-0604-40ff-dd29bc47cf09@web.de>
In-Reply-To: <5e9b29de-b93c-0604-40ff-dd29bc47cf09@web.de>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 16 Aug 2021 21:32:42 +0800
Message-ID: <CABSBigTmdbt71_ESZsO1ncpitfFkX81TekfRZdO53iNu2suBag@mail.gmail.com>
Subject: Re: [PATCH v2] ARM64: Only init bootstrap page table in master CPU
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=sMnqtrxI;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::743
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

Jan Kiszka <jan.kiszka@web.de> =E4=BA=8E2021=E5=B9=B48=E6=9C=8814=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8810:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On 14.08.21 15:55, Dongjiu Geng wrote:
> > There is not need to init bootstrap page table in all CPUs,
> > bootstrap page table is only for boot, when jump to C language
> > environment it will use the formal page table instead of
> > bootstrap page table.
> >
> > Init bootstrap page table in all CPUs will impact hypervisor
> > startup time.
>
> Did you measure this?
yes

>
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> >  hypervisor/arch/arm64/entry.S | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entr=
y.S
> > index a9cabf7f..69af05f9 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -22,6 +22,9 @@
> >  #define LINUX_HVC_SET_VECTORS_LEGACY 1
> >  #define LINUX_HVC_SET_VECTORS                0
> >
> > +#define INITIALIZED_BOOTSTRAP_PT     1
> > +#define UNINITIALIZED_BOOTSTRAP_PT   0
> > +
> >       .data
> >  vmexits_total:
> >       .quad CPU_STAT_VMEXITS_TOTAL
> > @@ -29,6 +32,9 @@ vmexits_total:
> >  vmexits_smccc:
> >       .quad CPU_STAT_VMEXITS_SMCCC
> >
> > +bootstrap_pt_status:
>
> Let's make this a boolean, bootstrap_pt_initialized, then it is clear by
> itself that 0 means uninitialized.
ok, thanks

>
> > +     .byte UNINITIALIZED_BOOTSTRAP_PT
> > +
> >  /* x11 must contain the virt-to-phys offset */
> >  .macro virt2phys, register
> >       add     \register, \register, x11
> > @@ -120,15 +126,24 @@ el2_entry:
> >       cmp     x1, #0x16
> >       b.ne    .               /* not hvc */
> >
> > +     adr     x0, bootstrap_pt_status
> > +     ldaxr   w1, [x0]
> > +     mov     w2, #INITIALIZED_BOOTSTRAP_PT
> > +     /* Check whether bootstrap page table is created */
> > +     cmp     w1, w2
> > +     b.eq    1f
> > +
> > +     /* Set inited status */
> > +     stlxr   w1, w2, [x0]
>
> This create a nasty race: You declare the pt initialized before you
> actually called init_bootstrap_pt. You need to reorder those to make it
> correct.
yes,  you are right. it shoud.

>
> You didn't notice the impact of this race because you also didn't check
> w1 being 0, thus w2 actually having been stored. If w1 is returned
> non-zero, you need to go back and re-read the memory until you had
> exclusive access and know the true value of bootstrap_pt_status/initializ=
ed.

Thanks for your pointing out. it should.

>
> >       /* init bootstrap page tables */
> >       bl      init_bootstrap_pt
> > -
> > +1:
> >       /* enable temporary mmu mapings for early initialization */
> >       adr     x0, bootstrap_pt_l0
> > -     adr     x30, 1f         /* set lr manually to ensure... */
> > +     adr     x30, 2f         /* set lr manually to ensure... */
> >       phys2virt x30           /* ...that we return to a virtual address=
 */
> >       b       enable_mmu_el2
> > -1:
> > +2:
> >       /* install the final vectors */
> >       adr     x1, hyp_vectors
> >       msr     vbar_el2, x1
> >
>
> The general idea is not wrong, but the implementation is so far.
>
> However, I'm not yet sure how much this will actually buy us because the
> secondary CPUs will now spin (if done correctly) until the first CPU has
> initialized the bootstrap pt - rather than re-doing that themselves. You
> may only gain time if the CPUs are initialized a little bit time-shifted
> or if those concurrent writes + dcache flushes are actually slower than
> doing it only once. Please measure with at least 4 cores!

Ok,  I will measure with at least 4 cores.

>
> Thanks,
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigTmdbt71_ESZsO1ncpitfFkX81TekfRZdO53iNu2suBag%40mail.gm=
ail.com.
