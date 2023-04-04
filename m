Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBB4FUV6QQMGQEAD6U5KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 936436D5A49
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Apr 2023 10:06:10 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id d23-20020a193857000000b004e9d2af9e57sf12745550lfj.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Apr 2023 01:06:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1680595570; cv=pass;
        d=google.com; s=arc-20160816;
        b=0GDs4DNRfZCwzYTFcQMQlzacEgPgIpimIomDtAKbAPtZ6DxbFxhWDELcxpbyYT/rJU
         K/QGupHXOREkamv6G/lELtn5rYW8fXAElpwe0bZncS1o6SbNO1piaupRYZz/arcjoJAw
         Z3qTEnGjPLdmIHCbrh5RVcvG5tpmyvojmv1+5U9xhBInig7Xs+xapB9/vLebyQ7DjcLV
         jseukGsu+xR9OIsNSWMhlBFIcbv/slrNF+1vRRx6Llrpoqd8M7r6dIeCaBz3hohGBhQ9
         OjwFW8SqaGBNT8a8dH0d5UhMb58LzPUz6AV2H9ZRl9/C7RpQidDKAlm+dTPvYHTyP4gE
         k0BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:ui-outboundreport:to:references
         :message-id:content-transfer-encoding:cc:date:in-reply-to:from
         :subject:mime-version:sender:dkim-signature;
        bh=OBk+UOxxE5F7Mn5uFqX5tazAJz2rKRETGbWRLSJQbhI=;
        b=AW2192hcxOhif3qbioodKdshXU54V9WgrSi+y2PpBTTPmbwOIeMXrXozfTMLCLi+FQ
         GzXSGiKwfcCStkGQIrhLtJNaOaXHlY4VHjqbQybBmhxb/tTowyMTiG8O2TQBnA77PWIA
         M6d0XFuneb19g5cVKFq0cpgdZtNL6+nZh9buC7y6b8PeJ6BmgrxAcsXW8kD9LtDYblC0
         kIxbd6lLuh5tCJh6FTCkD0bkv3AmOuiUmF2iOl6GFCmXw39YwU8NdFtV7dLdyOV1y4mm
         YXAN+gMr1dVClWKhzYH6IafZKToOklskikOx7AJm6N9lsZs2YHNTTXxe6ZsR682LEv0P
         oX4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=i37hCQtB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1680595570;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OBk+UOxxE5F7Mn5uFqX5tazAJz2rKRETGbWRLSJQbhI=;
        b=f2BsXB9GWfkpVP7R9Yc4YUb1+kPwmfMM79dlvmjrxuXmdLbkc7Xa+dJUm3j5PfdnVj
         LBtkA0+4qUnuUqDXN54KVtwoeTXgrHMglvZOqH2sk9z0O/yCVQRUC3th3Zs/0Y9dmokO
         4zHjq/TXEyOZV5ZfWzdbuMzndC8IYuEjMK1e4/5XPcXWr9OfwgJU/8M6TW8nvO0l0pCe
         A4CKlPikx65ilZ3ysEidr91MYb+6KGntTfXIduPG9NPxmNerBJEQt2k/Qa7ZkN4xbGNR
         qNCZO2O0eJgJPmAtOMCLposggNsT7AVClrNOEN2KOd6R8TZ/4sn0gsxdlvSZyr3cq9yz
         t1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680595570;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBk+UOxxE5F7Mn5uFqX5tazAJz2rKRETGbWRLSJQbhI=;
        b=2rLgxLoXs343yMPg0xpUHDf8ZiVdS89iXHUMHvuWw1NDcnfzXGwr7n3znfON2hy/hr
         7ovDJPzINR0ohw5KUSJQMUXXZjNxM1fN0OJABFtPpA1OK/lyrPN6r1ABDqveNKUG7ZLC
         V580IfW252x0GaMMS6Efs3PTiGslvVtcLWjJAkuyya1wJN0iGjufI2y3nfNFyLqQ8CZU
         p6CYhT+2wDHa91cddg3NAki7TsNMDfzKcNwuQGhW19bYb6HI+sz5PrS9KCrgqZ83IPpX
         sZW4LZae2DUqHUY4C3mHxwy+4gUQTfJqdPcS7+O4IleswcDBcfSC585wtQBjWvBCy02R
         U/8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9epvCP3j8cIwoPt3M0o7My3HLuDZ8NHDE6+JhGLquiKvVtmFaBf
	JmJ1ffc+HemiHeWfrdG+9bk=
X-Google-Smtp-Source: AKy350YRrUjCPQdE8Bxu8MIn+xn6f3ujLwHwy7/YTYvcHhZ4Gu4h7eBHnn5SaOaRGotMKUvFAWVNrQ==
X-Received: by 2002:ac2:546a:0:b0:4e9:bcf5:a0b6 with SMTP id e10-20020ac2546a000000b004e9bcf5a0b6mr467963lfn.11.1680595569473;
        Tue, 04 Apr 2023 01:06:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1114:b0:4e8:6261:7dc1 with SMTP id
 l20-20020a056512111400b004e862617dc1ls435662lfg.2.-pod-prod-gmail; Tue, 04
 Apr 2023 01:06:07 -0700 (PDT)
X-Received: by 2002:a19:505e:0:b0:4d8:86c1:477d with SMTP id z30-20020a19505e000000b004d886c1477dmr5965070lfj.18.1680595567371;
        Tue, 04 Apr 2023 01:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680595567; cv=none;
        d=google.com; s=arc-20160816;
        b=E262/ZGX47/mvFu3d0Ntfp4v9jHJiqyBSa2+5RMClOnQVm6w6RTzFzQdXB8upGfiMv
         UF/j9SBREXdO8Czc20xQgQwJhGokDRZt2U85uPVMYeMeV7WiZXCHTCr4mEE/jqpmq+CJ
         uPukenY3/nxuet6vi2P2ogk68//+V1ycMQDl3PcjGBatjQY4eTIrmilCnIluGnUNTfrB
         LQsF+HQZCLUvzR1+bYR0CqlgaJ05B5zzSjTyOs4IoX3OUg7FwYklDwP5P9GHULIQ8ZOD
         iVVUpBdAQNj2EEXS4txrYOcOYeoLx/u4pGTXmqIJaU2MoGLMwyvdWHt1RL16fvqhKrwr
         mJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=77rqQTdmgW435Aus2ZYSTurpnyXqERXNjznzf0obu8s=;
        b=pELOzY04qdTDVj187lVRdVw9Lgn8C2+SBAnFOMuhe8X2snXZJG7MeecrwFCMC6Bt9x
         yjVPjU9Ix2tdr10SDc7ZEmbOnTJ18XqBqPUb2zpHx38N4FvgpiPLH6z2Wg7h+Xd/Syoo
         Fa5Jb6bz+buGBflrNwKNaU+yfBBWEFTHgzdHGaL71CViY8UY0hPnBBHnFRJWqGFHxpLQ
         m7iPQ5vw6Ub1P/JgnaF0uMKK4K+Ihpa5S3Rw+agIHUR5+xrZM+RLl2HbkUF7py7QDV/o
         J0yXD7jXQlvLIzeuYg+qcC8WMEnPwK9sPiMTBW6eVm8l9SkzEzvUSonCdTQHTvaEzoc8
         6EKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=i37hCQtB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id k2-20020ac24f02000000b004dbafe55d43si521851lfr.13.2023.04.04.01.06.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 01:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from smtpclient.apple ([185.74.151.140]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQIv-1qEYyP2Qgp-00oVHR; Tue, 04
 Apr 2023 10:06:06 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Performance issues on Arm64
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <df4f654b-fcc7-bef7-d385-0841c16e80c5@tum.de>
Date: Tue, 4 Apr 2023 10:06:05 +0200
Cc: jailhouse-dev@googlegroups.com,
 Alex Zuepke <alex.zuepke@tum.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <998A86F7-CC75-4448-BBD9-18B5D9561DDB@gmx.de>
References: <8EB33626-D440-43B2-91AF-D1C06BD34770@gmx.de>
 <df4f654b-fcc7-bef7-d385-0841c16e80c5@tum.de>
To: Andrea Bastoni <andrea.bastoni@tum.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Provags-ID: V03:K1:lQyB2ddxTzhxa0iGdrPInFxDB45wyXT/6N4r6JZAhrudPMq1a7Q
 f5gDSo4ABFK6GGWTMaEHmOTn5aISLcJl+0r1C6Pu3mHz0X+FndVcUz+71ZgK4ovMKv+6DKZ
 I3CSoysn8gNnP06GP29BuB4iAAu+geQ3ew5Bu9gSSDRYjBbRstLdCa7Xhyy5/oaoZnuOTPX
 dyjvQRMALnrqmgvdl3mLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c2SHEsUkQC8=;Kij2gyRAkntD7vG5cun9A/rJx+8
 JY/UCZRsaJkHj1s0qeiYpgB3xQ0W5N5xo6TUKTOxtSIyL4+wV1JglMxJolO4HIq8TAuCc8D9o
 SLCyJ93ruf3c516hGHWrAS3FlBZGW77mDPIfE+sj0gv1s5frG01sZcxk3hlFDd5ALm6Io5Gpa
 lZm8HA6gMg5AeF4Hd9zxUTcYVttJvvuLzADVUpNvDjoAIMP9bJOKUQbRv+vzOzEDqXLSTMjAB
 PwoO9zBDwTOEAEWZ1jA8/tU4KxsgYwLCLZpkiPkWrMl7abLkhIkXp+VOdK5ULGQgfwFRjqYJH
 bxHFbVr+Xf/vUJLyuqsThQGrUFkIjKPbFdCvvUePqxSx9spFMdM0mjN3J3M/lH+QYLRyfMI6y
 8oJxCjMGm6/Xfveu38INIUt6/JUguNRA8eQoO/zVWZwtriZDQbQ2LSPxjWpz587pb8ashd3QU
 D/7TB4DM0PP6pdJS4uD12EYXUPt6xA3tz3bX22Gj+/XimeTrvZe3IYdXLQiUbgGRHhazhh4aM
 VerLdUi07KeuUw1KQ9JZiDeSoSUA+vvwpgObHzpfCj8fzMgdVconTVLguH3ysrgAX3m8rvI5g
 UVnThJGQD17f6iQ99dscfYH8OQ+4OkLPsNf4Vf0smASuQ+hfT/yQkuY70Oyk8GXHIUkWhAqpl
 bg0gtZ4k9YNDQjzEX9imSf8QvS0C2BNdHs+TWpeRh5wkj2X/M6l9BP97sQXrs3uTJvXrkSdLL
 wY/s4lZAmEm+R0BZPgZK1Buwmy5/sH+up+YaJ1ybAD8xcEZD9D4YZjm2TLwMHJIjzZ8KxPU8H
 FSp9ePo55FDIpvciXJ/fMsIktRUTKho4v0f6ywJDDOMvvjrBnUV9y9ddXqTLWDNocTz5P37Tl
 HE3+U48aW2NyAZvSrkHhq8q8+KMGNm7Efy5HwWtUhN2NT2bpNSdGhw5zXoqisHdJvij/Ikqh9
 hgrwBlrKWymTuSOZExZmsxRMzzA=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.de header.s=s31663417 header.b=i37hCQtB;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=gmx.de
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

Hi Andrea,

thanks for the hints. Unfortunately I=E2=80=99m stuck on ARMV8.0, so no FEA=
T_EVT. I guess that leaves patching as the best option.

Kind regards,

Oliver

> On 3 Apr 2023, at 16:43, Andrea Bastoni <andrea.bastoni@tum.de> wrote:
>=20
> Hi Oliver,
>=20
> On 03/04/2023 14:46, Oliver Schwartz wrote:
>> Dear all,
>> I=E2=80=99ve been hunting down some performance issues I had in jailhous=
e inmates cells on Arm64 lately. The problem was that some operations drive=
n by interrupts in a baremetal inmate cell failed to meet the timing requir=
ements depending on activity in the root cell.
>> I=E2=80=99ve finally figured out that the reason is the page table opera=
tions in the Linux root cell. In arch/arm64/include/asm/tlbflush.h in the l=
inux kernel all page table invalidations are broadcasted to all other CPU c=
ores. As far as I understand, this forces all CPU cores to flush and reload=
 their pagetables, regardless of whether they are running in the same cell =
or not. In my case, this has caused interrupt latencies to increase from un=
der 1 =C2=B5s to above 20 =C2=B5s in the inmate if a Linux application did =
some heavy memory (de-)allocation.
>> Apparently this has been addressed on LKML before, but the proposed patc=
h was rejected: https://lore.kernel.org/linux-arm-kernel/20191101172851.GC3=
983@willie-the-truck/T/
>> Since I only use a single core for Linux I can workaround this issue wit=
h local updates to the page table. However, I was wondering if there is a w=
ay to address this in the hypervisor?
>=20
> A hypervisor-only solution is possible, but suboptimal if you're not on A=
RMv8.2+ boards.
>=20
> You could set HCR_EL2.TTLB to trap TLB maintenance instructions, but this=
 will trap _all_ TLB maintenance instructions (so, possibly quite a lot). W=
ith FEAT_EVT, you could use HCR_EL2.TTLBIS (TTLBOS) to trap only inner (out=
er) shareable updates.
>=20
> We had similar issues with cache invalidations (where you can use a simil=
ar trick), but since we didn't have a v8.2 board, we needed to implement a =
patch for the OS.
>=20
> Best regards,
> Andrea

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/998A86F7-CC75-4448-BBD9-18B5D9561DDB%40gmx.de.
