Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKE2334QKGQE3FNQ6IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D42450C0
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 09:22:17 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id a12sf1873744ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 00:22:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597476137; cv=pass;
        d=google.com; s=arc-20160816;
        b=ueuEtQXWHOrKoBubb6WuzRnwERF4qEobJMpPWIscdU6pHsODmJFEpOWk1mPkUme4wT
         ik/ezynn0/fkt4/m1xcWtwFq/avtpv3QSBsXZ9m7ZxM056pKbidBXaN1eKt1BTbGyg/d
         gGeDH8boPZMBw3AGQP8958bZB1Z6dRRiQtJbDwtmC2kqZtPszR6Xc5m7gjW3tTfP1rbE
         uEJdJ4YWic4tqY/PC4UhW8p/GXIpQTg8MiN+vMC13kBy+rEODj23hVtuhJFp2vdf/70f
         pWD2dfF61nM7BX2pUIzS5xeUeShvlssnbUzoNKO8q12ATkxblXB/1Tb+A5JOes8Lr3RV
         ORvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=6Zzxkq40qH5bAdke5P39zeb1zVTGSJglGcHvs05qDOY=;
        b=lhBQ4DjmwE4naLkMcJYCdGrbnyvpZNtu9ZwODlOW/3i/tk5CEFI5e+GfhwUtRDATQb
         H84yB/XyETPd+6jCPUTddz6jR9N9WqgbTLi5lsGjBXAzWlLWvVaDTeYQ7qW4c7OCfKWX
         Rg2k0kKT+P1TBNNBN0FwcOEic7lT87NkQZNSIivhFwWqhmqz+IXOtl24Wa9M9R3IpFOv
         w5nHuv4den4t3J+5TdQEjUnp+9FbfBIHtLFh2eEsAA49YIQNvfnDMoR0FeUreP2BBnpm
         ehdeaxrNqS1Qyfvqu9GTGRWaNRMoeGgNvDfdXiw3l6af1s42higkI360aAdDO1hm8HFI
         Jlbw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Kc8TrSet;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6Zzxkq40qH5bAdke5P39zeb1zVTGSJglGcHvs05qDOY=;
        b=pEWPIffYLOY//edaKFY1mqNn4fQsv0bkqHQWX0Waa/2LhyVZRF1fc3wMAKoFbdwv7f
         VN2CBT4VPQ6HJ7pkfZqd8tXE7/+BOdaPPUT9sdwtzeJaJBmBuWiKt1ltvGJwqN6NRejs
         JQxuiAcuZjxRu3gLUFAF+VwCdmwJ77rD4G7qnMeM6/poo1iNk6YyGot8FL0KV8+fRzq0
         g0GHuJqj3s2W+EM4U5qdnn/lGYFz6j5Ub2CZvIzjqqzfypYDiC+SPh/tFKGcv1GhX1Oj
         akILn3NqHIFh8dyslCte4JMgPBTBU5eqwlRromI1a5p6FXjBG7UNNCjUhXIIA4c/9yyE
         HenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6Zzxkq40qH5bAdke5P39zeb1zVTGSJglGcHvs05qDOY=;
        b=VicT3ns3qAgfmSbY33FLcWStXEnegBbxvf4u2eTcEuxgpNVy1ruGOY3pkmMYg5/WUs
         GFJKBtVThmyj/WOXLgai/vXF+JI80iBivQQHM5OD7KbEyIAF/TPVSXao5VRNjk42S4Dt
         RuvXMtyDbw4vj0ohkVuTJkR/ImVcnFMWJ6m47v5j6j0BRrc2uJYYzRKPoB0A9igOnbHD
         00GtZHvGUUdIixykFYZB5GUSbcaJWzmAEQi7z63tzXuefnY8eA+jeZSwI7gE+GmYlpCs
         JY8JtkyGWIqLX3oFHAEe73rrZKnJwcqbobaxMgjDdOCBEHjGAlHjzFc0gVMDstbvjdMi
         w6bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335bpZellCjpdl1EOHjTaIUT9TbseJGHsKVWWkFpINJmnGQtNH4
	usxgi20pur1ohN0lSOQ7Zdg=
X-Google-Smtp-Source: ABdhPJx7ft5lDx2cv/m44IlCKjph6gqRTgtuRc6+o+UgKvQWCs0k81tK+3blug5ECebzuJMYhbKDhg==
X-Received: by 2002:a19:224e:: with SMTP id i75mr2910966lfi.58.1597476137112;
        Sat, 15 Aug 2020 00:22:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:300f:: with SMTP id w15ls407481ljw.1.gmail; Sat, 15 Aug
 2020 00:22:16 -0700 (PDT)
X-Received: by 2002:a2e:88c1:: with SMTP id a1mr2934566ljk.425.1597476136236;
        Sat, 15 Aug 2020 00:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597476136; cv=none;
        d=google.com; s=arc-20160816;
        b=NvSyFiOma0ytXDAHn9DJvYE8y/m1sknzpgBl5Gdh3/RsFN3jfcn7HIzmbDXvYpc12O
         8tGtB242svGIwyikPFbvb58mCvEc0w/uPyDt/9Xa8flj0NndZqY6IzaPjwLA8zlCeWex
         GzD16/ZZ2z3BmGl5dnhlbguWsRjrM4bcVaB43MxaPQ3d3mDoYXv2SqrxJGmcJAxs1HQB
         YsbR4wbvXIzj9Owe49ow3DIqQ7BYZym1qPc5UyFNd7hpXPK7LvlDLWrc43mdcmWzTus0
         Ct7+8mkS9ixi0oe0YPgJLHO41MFS8mf8OyG8cCIMEnsOYa6ruJzHZtbbinfvoOt2oLNH
         1Jdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=M9QX6V2SQ9l0t2rxdP6WcYiH6TePhYFahT+ixSV98wA=;
        b=tCdEGi7PvXn4Lbv6TuBvKZCsIzaNJEgUA1+tuqN0lm+Pl5J6ZeEE3wSDoy0MLB4CPh
         CS5IKn1bnvNRqQbXUz/5WcHZHWNztwMSqlkVeP2S5G5JAJWonuQqFDVfanpNSG8tX2Ca
         SfGSLeGlYw/PuwpNZGku0OjEgEmufsEJKHbyp42gpBSL+SLfW/I2VzqKH2CKCIoFw0I8
         coLiVu5UQLoyvUa+o1snQa3020kKEPSEHTxztET4gyIqvAnT6gjEK2vXBKmPGRfE6W+s
         AUB8gX2KSxWnwRMpr5twOj+r5yYk2wHCvb8kv+1RhqGlTmO1ep4GOHv1Y9E53+61g8Yp
         Bmvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Kc8TrSet;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id a23si509361lji.7.2020.08.15.00.22.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 00:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MF3Nr-1jv48q1sh1-00GM2L; Sat, 15
 Aug 2020 09:22:15 +0200
Subject: Re: [PATCH v2 7/7] tools: config-check: add CPU overlap and boundary
 check
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
Date: Sat, 15 Aug 2020 09:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:ajxaJKI32xJO77wSUXUcATDb5/napxVyAxEyGB+7kd1mi+t+DyC
 Szqjn6x4peN7Rmrp7btbiWBc6nn6G48WG/Zu72Ez70Nu+6z7VnEZg0SnS4R6DxFvAHaiSBH
 iolL1Okkab0SfbnNjYu76YM0WlGp6Dx4zhGd8yZhHnLBFXENbgRDGQM457jVu1VVNDgiQoP
 cIoJ37F95RTyhEVbOi8lw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rvHqikSjDK4=:Q51Ah6PbmPruD1196fcFrP
 ol5v6Xd5uLN1R29sAiMtNhsfxoxgn465Kg5ivxK3iFML/bTw1HScAcuI2Uq96AjGahr3ElUmG
 zBV+oGx/q0gakqMKFZZ2rYv0Ix3x13HlDS14SfOHhC2HO8W/re9i+A3HFjKjqGcAhGREMoPG2
 woLq2otZeRaAcO4TK323GM4uV0MBuvra/Uh60SQsI4uYHKHfk5lVCHP0N6WePnjt3RDI9yh77
 Q9c8TNZgAE4WoLRerF4cu3dGwTVbaWbIglCT3fE119hBI+r9DgIeJ0Sil/ka1mBbc7gicBYKX
 zZ3/L3anQL6KJM3jTGCmXdLvvx8uNBfqHYyIBq4z0luJFH3IuoTo6ym3QhVjUd94+mIIURF3I
 PQ9Ozu/IwAhMvVBAMkhfdz4fcMT3M9fBIBo9E1GRMwLoC2rvP6CkGFUbOUU+zfIDaOkKVUv9e
 rTK8B2kIWcNaeYJhFfz9zQxbtMxkAy3TcounPy5xfMUL8rsPz8Nmpa4POX4plkrngUelyLXY7
 At9/fCXIOqp4ybh/lRNzk60igk6YNokcWbOsCndC6HLA2+I5yhtYhvblgVEzSw48GQXYlTgaF
 9XiAWyzKcPZz5pCWMuJT1Xsf1PFfqQocimBgWO+IvfimWiQeL2UQQM+/AM+EoU9KcVGITQrf8
 clWoXg1Md5SD5twlHJXgU7ThQlNfEXfq3GEyzgpYlBeIvHvMtVaMERQtWJ8Sy3SpHOn2aX4/d
 2kifNmfA2Y68q7Hl7LKADG+M6b98Bf3nIhrSGsG2fUT/xwNDHh59i1xnQAqdEs2O+NZfx80sv
 Cb7d4VNItq43s7Yx4c2BFAKHkVUM9acc1m0qXMn8ZOmwDOm1A+0wA5QXVIBl2js0aBJx4mNy/
 rGmnQ1cC4OqcBlPWCN0qJFPfZxhqdbnjmJg8ikYcmooxhjfRtFBptBNoBwCEHO5duzanrg3hR
 CFV5pgpyjYKZmhi7B0SGMsg3yPZSIt0AFssaXKgeH4EZ54ZYNr6l93LtGMm5llFPLVK4FNxlm
 +rPKnz6wBVMhn7cartjR//6qQhU71bt10MKfwV0NbJJoILbjRd4nyxpaQjV1zBezdShDOYof5
 KLK7NkHLdkoSo1b7GXm8qWyi9HHCXS8bfCjod7qg7FSkwImlkGhhd+iX8MnUTJDf21RtNgEur
 pNN/6XYrJfyEJCUR+dEkof636nwaV6sHacLnmMnuiWxZ8Zr+bRFr/fNCfZclNZvi1I0pjLU0Q
 feDvwyoBbsyZfyDg+/R2JYQ/nL9lfxf4Y/wuh2w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Kc8TrSet;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

No commit message. Could explain what the two checks are about.

On 15.07.20 23:21, Andrej Utz wrote:
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/config_parser.py | 14 ++++++++++++--
>   tools/jailhouse-config-check | 34 +++++++++++++++++++++++++++++++---
>   2 files changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index 2b47d9b6..2a0e6ec9 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -192,17 +192,19 @@ class PIORegion(CStruct):
>
>   class CellConfig(CStruct):
>       # slots with a '_' prefix in name are private
> -    __slots__ = 'name', '_flags', '_cpu_sets', \
> +    __slots__ = 'name', '_flags', 'cpu_set', \
>                   'memory_regions', 'cache_regions', 'irqchips', 'pio_regions', \
>                   '_pci_devices', '_pci_caps', '_stream_ids', \
>                   'vpci_irq_base', 'cpu_reset_address',
>       _BIN_FIELD_NUM = len(__slots__)
>       _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x32x')
>       _BIN_FMT_HDR = struct.Struct('=6sH')
> +    _BIN_FMT_CPU = struct.Struct('=Q')
>       _BIN_SIGNATURE = b'JHCELL'
>
>       def __init__(self):
>           self.name = ""
> +        self.cpu_set = set()
>           self.memory_regions = []
>           self.irqchips = []
>           self.pio_regions = []
> @@ -213,7 +215,15 @@ class CellConfig(CStruct):
>       def parse(cls, stream):
>           self = cls.parse_class(cls, stream)
>           self.name = self.name.decode().strip('\0')
> -        stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
> +
> +        cpu_fmt = cls._BIN_FMT_CPU
> +        cpu_set_num = int(self.cpu_set / cpu_fmt.size)
> +        self.cpu_set = set()
> +        for set_idx in range(cpu_set_num):
> +            cpu_bits = cpu_fmt.unpack_from(stream.read(cpu_fmt.size))
> +            for bit in range(cpu_fmt.size * 8):
> +                if cpu_bits[0] & (1 << bit) > 0:
> +                    self.cpu_set.add(bit)
>
>           self.memory_regions = \
>               cls.parse_array(MemRegion, self.memory_regions, stream)
> diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
> index 380f4a77..d7f405fd 100755
> --- a/tools/jailhouse-config-check
> +++ b/tools/jailhouse-config-check
> @@ -66,6 +66,7 @@ for cfg in args.cellcfgs:
>
>   ret=0
>
> +# Memory checks
>   print("Overlapping memory regions inside cell:", end='')
>   found=False
>   for cell in cells:
> @@ -79,10 +80,10 @@ for cell in cells:
>               if (mem.virt_overlaps(mem2)):
>                   overlaps.append("virtually")
>               if overlaps:
> -                print("\n\nIn cell '%s', region %d" % (cell.name, idx))
> +                print("\nIn cell '%s', region %d" % (cell.name, idx))

Error outputs should start with two newlines. The additional one is
there to visually separate each error report from to other to improve
readability. Note that there can be multiple reports per test.

>                   print(str(mem))
> -                print(" and ".join(overlaps) + \
> -                    " overlaps with region %d\n" % idx2 + str(mem2), end='')
> +                print(" and ".join(overlaps) +
> +                      " overlaps with region %d\n" % idx2 + str(mem2), end='')

Unrelated style changes (though I'm not against them).

>                   found=True
>                   ret=1
>   print("\n" if found else " None")
> @@ -100,4 +101,31 @@ for cell in cells:
>               ret=1
>   print("\n" if found else " None")
>
> +# CPU checks
> +print("Overlapping CPUs between cells:", end='')
> +found = False
> +for cell in non_root_cells:
> +    cell_idx = cells.index(cell)
> +    for cell2 in cells[cell_idx + 1:]:
> +        overlap = cell.cpu_set & cell2.cpu_set
> +        if overlap:
> +            print("\nIn cell '%s' and '%s' following CPUs overlap: %s" %

Missing second "\n".

> +                  (cell.name, cell2.name, str(overlap)), end='')
> +            found = True
> +            ret = 1
> +print("\n" if found else " None")
> +
> +print("CPUs not in root cell CPU set:", end='')
> +found = False
> +for cell in non_root_cells:
> +    diff = cell.cpu_set - root_cell.cpu_set
> +    if diff:
> +        print("\nIn cell '%s': %s" % (cell.name, str(diff)), end='')

Also here.

> +        found = True
> +        ret = 1
> +if found:
> +    print("\nNote: root cell CPU set: %s\n" % str(root_cell.cpu_set))
> +else:
> +    print(" None")
> +
>   exit(ret)
>

Applied up to patch 6 now.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0da1d517-ea14-07c7-05ff-9d529108ef87%40web.de.
