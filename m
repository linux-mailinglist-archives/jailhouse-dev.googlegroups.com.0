Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBY6P4XXAKGQEXFQRZPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFA2107F96
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Nov 2019 18:09:55 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id l12sf1872426lji.10
        for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Nov 2019 09:09:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574528995; cv=pass;
        d=google.com; s=arc-20160816;
        b=l9S11PcBXYzrlF2nDvPpN+x/M/zppQ4lpzeaO/72VM1d2eyPpB6sffa01JLefy3O0D
         ZymcaylIgsOIseI6wNNA7pZ3PkWQ9YMPHz/kBfel18XkSuds1xy5dBfJrwS/eqEJizr9
         0gGCYpEH4E6eopBa5ehM4zPB9U3X0NXydZ1Q2Kv5GJhg4Yc4y45XMmGcOyDIkMcfLQgv
         yZSTL1PVrNh5lyuZrMsfERZlCpbVQjLY347KBplyOIYmbEiY9nwrlE+l8jNIRXbbfpm/
         9niMOreFER+o9IlsbcnpPyJ68Dn+F3O17fKSmkbVpLjz5ryxrYavg0rl7XucSBPO52lv
         bm0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=UuBPn1+1C9aM+Sq5QQ8/x6katmQFPDwHU7x0xI8HQDo=;
        b=TlY5j05wLgQjHR083O2vTcGekMtMR3nCq96zL+qfwXtIfNLsego4mAB0ot3jcO6JOJ
         M7YJLmxMFbxxPOa+QwPKZaZkiAWcgjrJEPIDwLEWCXQxYRzI9pR2dsiJcjeFSVUtF7Ll
         iVMbUXMZ2QqW2MRlPQEj2C+wPznb5kv9C1szvGUjNSDRgCmpgBIeiSZYi8xV2/ZRmTru
         gapsWQcn+bXwuc/bWC0SXpi4wbCxNYFDkZZpHMwvCPI4/+llmHrppkyWIviJDhto8hnJ
         lu0OS5ZC2l2ZsK/lEYprdguvFYPvBhe+IBknZejEyVrumAWR7YkIb8TCEHgOJ7j0Mtkq
         ZYaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fBkNFhJD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UuBPn1+1C9aM+Sq5QQ8/x6katmQFPDwHU7x0xI8HQDo=;
        b=aNaPNI1K8F1M+NVsq7Rh+MkucD3T5UoKwfxb1TVLava+YISLhI7Y0r4+oiR4r1I65V
         fgCQZpkJrJvnk7+JDq3RdJSudvItk5TXMd5TyL818FiI7TdaYrxrc6OyacXmf10Ow/pG
         WfmbyX8BBaiKNUajGds2HG7I0qw78881lw19Sti5LaaDeTwZoPMeUDQ5pDS6UAxMrfqa
         eN6CTza6nnH1oD6+AX8lQFR0pia4uUhcj/xKxwMYpJOrvhbER9aVJixaFwElla0q5O9J
         6vLdnXLILxiWBGAu2Qg1lvaTtJSJKe1lFD041OgqaihVJGdooIT3aBvVyXb/X6j4lYKg
         S9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UuBPn1+1C9aM+Sq5QQ8/x6katmQFPDwHU7x0xI8HQDo=;
        b=iJ1ndyx1ZEC3+avQpV+P/djYqBtHIChHcB4KmuSvOEQScfgnQK3sNvBpRVCLh+ThO+
         Zteiv2RN3lBZV0FUYi477L95UrTnVw9lVciUmEUhIUp/XXagVLE1UIUFRjGFYyeYCuRT
         MNSnHaZxvqXYo80WuJJx96Ws4zrJNxU7DLUPosw0M6VwzJjQSd285aoqN3i8XCH7AVdv
         JK15XRmrcQ/misGJsBYeVnWLyPg0/Vr/VxQU6MaPGrwxECH/LjWX45NXPeQOEqBm4HqP
         gvHzAKquy2glLcAqe7zhGSio4tSJfaGwoBi1zKxPK5Aex7sdmIMNAxp52ZhKNRaKcEv0
         jfjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVK2JytgGd+bQOkWGopkFmY2STsjVNb8S1u2nTulQdq5kNL4/6W
	d1FyQKQ5JBy6JVULVobUq8k=
X-Google-Smtp-Source: APXvYqzWAym/oJSO8eIQt4u2+y+ORhIh0nb0+jvdKpb7Dgqh5gzvkKxQPhfxV9pIDhD4SBUY8LzHpA==
X-Received: by 2002:a2e:89c2:: with SMTP id c2mr16394332ljk.161.1574528995498;
        Sat, 23 Nov 2019 09:09:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:961a:: with SMTP id v26ls1854368ljh.5.gmail; Sat, 23 Nov
 2019 09:09:54 -0800 (PST)
X-Received: by 2002:a2e:9256:: with SMTP id v22mr15630839ljg.124.1574528994817;
        Sat, 23 Nov 2019 09:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574528994; cv=none;
        d=google.com; s=arc-20160816;
        b=Ga44/vfYlUgqiodbuUDrgFvL6KFux1CR6KMods1oFFy7SE48p1ZA8NNmqKBqS87/+l
         VY2TKpPpcx2mqjrp349ivj9sZZxyUBm+ptzdOH2AebgInRzU+CPzyYl5qpSW4uz2oMur
         aZNDyUIEYz8TM607ER5hvOhACEVyZIG1695iCBAVr5kPNbXxecAe7fkGegDDrnygxjd9
         n86X9oLhlpx4zQe5FfB/52bwLN/ZY/SZp9xINWZwj28jgEtResxTe3zNrlfC35egD/Yu
         UAKenNVHRqJCSkDn6yyOkk7iikWwa/A0CIUBBxt3s3qQuCEkdJuCHU9MCe09UkGphZ9C
         kHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=AwZbFVjE7couLwLdN7aeau0EtDQPUF+e4uDxTKiS+gY=;
        b=bCZH3E5oAWAwSeNQ/m+YpPQ7HETJeBD3wkn4mzAsF6bWyYyf14wGFSSHNSjFarxaGX
         2Xtr5WneS9xY5WFl41n+/uWYQneapYjSpkqlROf24PE2PZBVWgpTN+j9Ju55hHYk8KX4
         6sEYKMOa+V0i5NfG1yuACzqlN64RX+TZwHmRbIv6CPe4n6zlIBaAQJgsoX9pL2sWhpFZ
         uLV/l+7Wr/8B3QL5HfMY7/wCQloBXWxgK8YCFOlmrpLlaQ8XofbhyIkn5KjSKi7H0U6o
         EkfmJ1Tj/hnOO6qf0qqbW6CITwrMcOgOcR2ETAUVTmMvyJ4hw2NHmxp2J7wq4MjuLwmG
         MDvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fBkNFhJD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id c17si58325ljb.3.2019.11.23.09.09.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Nov 2019 09:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LkhAC-1i0b4v2m3Q-00aSL7; Sat, 23
 Nov 2019 18:09:53 +0100
Subject: Re: inmate freezes when accessing GPIOs on imx8mm
To: Felix Schwer <feusscix@gmail.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <5dd9497f.1c69fb81.47354.a05c@mx.google.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <85183e3a-8aaf-0aa3-656d-0dd38798a29c@web.de>
Date: Sat, 23 Nov 2019 18:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5dd9497f.1c69fb81.47354.a05c@mx.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XxTxuSJJcV/Vf0CnpJXHDwcsKPyKoyEFD4SZEdaW1dE2Fw6EfQk
 3q/4qdavii6m7ngO6yzn+8WZOcg7MI11dNHkfc9eaSfu0XoCoRe9AxfguyhRayDdm++39vf
 arpSlD6eZNFy1KQ6uciAQghg17IhfcyjzXBlbw8ad3vPhljeTfS5or79gKfYPHaHAiN91Lm
 TKQs2319gx+/Yixtx4K1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eYcok+ED8B8=:3yeCappHv0zE97Sny/97CG
 Ki2OIP5bmC1TJPtFAEyJaPG3AB4PbIKzQt9O620k3Ycpri3uSSyzoMrZXBWsRSqjN6iYyr9s7
 0oyIL9Z3QPrat39cJ7KdFhbwJRmfOVc8WhCVaqRc9IFpHWfUi7Z+N+hMP3wFlRonAS9sn0DMs
 FnjawPFy5bzQNekHx3Xsfj0VmbC4YMJkZSK3sqCR5R0Iy/YLvqLMJNtwqD2j7LaF84FcFIQSs
 527YY1Xjwy90H1T1dFX3NQt/GYteMv5bP0HA/8dVVDyvp564mECICnzjzbIc26GYJBVb9qPLs
 9UPHlhwEsSs5Mf22K74VepdfUdIJc/li6Pc2DGTnTcdPLu32OKpmC7NIu50kET7/PK24ArIO6
 DYPsjtDd3qxxczOv+lPPSd3H5uNR9Qg7p77NW2lZnzY1phRe2h6toc7J2lLDXZF+bNP3uaN2x
 oyHhkdxe7y2dCJEz6NIMyywR9fJmfMzGWzCCJP3wh7wnmPkW1PWwTBJ1yU9NRag0XX3RbCnLj
 TZSuCbZBoJNzRAWiJhYJEWtT7Knm7QStW0MC2j46YpW99pB9c8OJn0CpSA3Ad9Mdedm/ntJYC
 8D62e95qIGD0wPh3/e/7HGRNyWD4GUJVDfwQdW7oJ1pd2WYOH/QwYkZ2mw6g3sLqHQGDM0VZ8
 00pF9up/0E5nR01SXyMyB98gmsX/wnHNVmMCUHCKWiSSrbYFSfEe98fktrYnrOXH/1XDVdloN
 Ji3ahiihQlzgaEhMvR5ru2Bn/0p0lCbfZQ8WzYhV1bbKdyemh6rN8rWlp+z+nItceQ5Dfs2yG
 4dJ0kz6VKU+MCFPq+sKp1MOWKql1UMu/9Ebs06o8l+yh+EHxiUhwieTTyriG7Phe5XzrsaIc9
 /nKvqaFnkDamIo7+NcH3qNrrV5aFgU9QqqBgLGiba6YP+f0+kyl6mF6FjgiTFXaPBz6svEFtG
 6s4dimtr5TDKT3zF9uBP8Hls5bt4yA115slzFX+WIRNfV/+LQRgx9J7pALPdMF8ZD1cyr7EGJ
 lLaItB5dBOtl3pEPPFZwp9N8tHtuC/bTXRzVLcSi2xhsC9j6IqOTG1D166KEvJZMoBth/jK6Z
 mEnHQMKuXB7rCDmwIbwBRDmX4I6YrWfDjqhEVAB39VTqJtisPBScFNmKEZABiDcqR76ke5sTn
 /wv2OFg30hGPiemKjmP5ue/vahJZ1SArbAquPC4x/QtkkQjedmZc4MCVCCzovV+j7p3NY+RRe
 KUwD9i+4c6ztpH8r5119oef+6u7OuMhCwnwk0sq9tNE9yp0ZcehvwTPV1ecA=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fBkNFhJD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 23.11.19 16:00, Felix Schwer wrote:
> Hello everybody,
>
> I'm currently trying to extend the IVSHMEM demo for imx8mm
> (_https://source.codeaurora.org/external/imx/imx-jailhouse/tree/configs/a=
rm64?h=3Dimx_4.14.78_1.0.0_ga_
> <https://source.codeaurora.org/external/imx/imx-jailhouse/tree/configs/ar=
m64?h=3Dimx_4.14.98_2.2.0>)
> to allow for access to GPIO banks.
>
> I added the corresponding memory regions in the cell config=E2=80=A6
>
> /* gpio3 */{
>
> .phys_start =3D 0x30220000,
>
> .virt_start =3D 0x30220000,
>
> .size =3D 0x10000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,

You only need JAILHOUSE_MEM_IO_<size> when defining a sub-page, i.e.
something smaller than 4K. It's a nop here, though.

>
> },
> /* gpio5 */{
>
> .phys_start =3D 0x30240000,
>
> .virt_start =3D 0x30240000,
>
> .size =3D 0x10000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
>
> },
>
> =E2=80=A6
>
> I also removed this memory sections from the root cell config:
>
> =E2=80=A6
>
> /* IO */ {
>
> .phys_start =3D 0x00000000,
>
> .virt_start =3D 0x00000000,
>
> .size =3D 0x30220000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
>
> },
>
> /* IO */ {
>
> .phys_start =3D 0x30250000,
>
> .virt_start =3D 0x30250000,
>
> .size =3D 0x0FDB0000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
>
> },
>
> =E2=80=A6
>
> Also, I disabled the corresponding GPIOS in the fsl-imx8mm-evk-root.dts
> And reserved the memory sections.
>
> =E2=80=A6
>
> &gpio3 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable gpio3 */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "disabled";
> };
>
> &gpio5 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable gpio5*/
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "disabled";
> };
>
> &{/reserved-memory} {
>
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio3_reserved: gpio@0x30220000 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0 0x302=
20000 0x0 0x10000>;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio5_reserved: gpio@0x30240000 {
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no-map;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0 0x302=
40000 0x0 0x10000>;
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
>
> =E2=80=A6
>
> The cell boots correctly and the inmate is starting and running.
>
> Accessing the GPIOs via the gpiochips in Linux worked (before removing
> them from the .dts)
>
>
> When I access the memory via mmio_write32(=E2=80=A6) =E2=80=A6
>
> mmio_write32(((*void* *)(*unsigned* *long*)(0x30240000)),0xFFFFFFFF);
>
> or mmio_read32(=E2=80=A6) in the inmate freezes without any message.
>
> Am I missing out on something? Are there any specialties or other
> configurations I have to consider when accessing GPIOs from the cell side=
?
>

Likely, you are missing map_range(<phys-addr>, <size>) in the inmate.
Those have their MMU enabled but only id-map the first 64K and a
potential UART.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/85183e3a-8aaf-0aa3-656d-0dd38798a29c%40web.de.
