Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDMS4HWAKGQEUDFD5OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7AACC89F
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Oct 2019 09:41:02 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id 38sf5565390edr.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 05 Oct 2019 00:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570261262; cv=pass;
        d=google.com; s=arc-20160816;
        b=jljGLvznVFaPb4oBoFdZwNPldblebPDcQNDriIRXfCLayjjf3re3MqEi3GrcbilXN3
         LxLoRQmjCIzMD/89PSy7ByIDUpk0WsDPm3Wq5GZcd4KxyX0O8GZdCB6sl7yMYlhHWEcj
         /iRn85P+ji4eXNgsXvcleBpRrCRAQgDzgvY8+HeASm3wY65ckQChpWXH1+gRscBnXhEe
         yTPVLMBJh24SogQYaiyJ5zIkJemKQVSYZKbDu9yO7NlOi/6fo1q0u0e28j4Ka4Xo1iQC
         X9/YIXKRP0JL4izP71EV6Ciz9jx6YbjDf4xf37qiF+eMpUcHh0FjTZwGmB6etZSQSv5w
         +dVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=jKFDTcoTVif9ZA08NQ75rRD6bFkS8lzZvRtRkP//Bok=;
        b=qLUrQIIzeZ5FC1jXouV4woi6FMRa/Qooq57kmQGlk430EEwIAA3nfzGm0OMcyyknn4
         ELuKEIjiGjGFM8nON+3cfI5Mruu7NjpvRfOQ1bVz4VO/R/6KE3wtjT1eh8CVuY50we/T
         6RZVUUkGbi80NnUFeN034YNR8mAvsAJFGBS/D0399+buNvvU64ktF+ZWDPpfwSTvaXy9
         ciuh6214LD+AoKfDoCYyhdc+C5VdKD4rsEIEHUj0bbqizSD7n0KRnSuT+aVs5yGFX80c
         6YMfLIOIAdtAJnkz550yFsiIoRGQ06zMl9qKJNP+ubxpQu+JzjsnnJIS88i1ZLrRp2dk
         l8SA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RfrT5LYu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jKFDTcoTVif9ZA08NQ75rRD6bFkS8lzZvRtRkP//Bok=;
        b=nIw58QJTb3HgHGdVI5Yd2E9I5zA/0IHl36RGi/jAVh8dXwns5YEiNOflgbiX49udCV
         tIP7NKzkz+kgHf3xS6nPDUL+0RRahylnnJTSGAxF7PHAX6/Ji/++RMaCTftqX/KGpnKZ
         CZ2W+jG6tP42MMjuppum487iTD785EvEMlG50Db97QV050dniJIZmulbfWsPYVTH6VKT
         fQi38vuLTnwvGf4QopsN0PcZYKKt6C7MkYMIDQKelSslI2sKOgpC2NsIPap+L9vZYaxB
         8Q8Z+xJ8gELuQ8j3+YLkrXNKRD7jPTpj1mAPAi+aoVV34+Tr+gmx+Dlt2NGyhDJpuVup
         S/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jKFDTcoTVif9ZA08NQ75rRD6bFkS8lzZvRtRkP//Bok=;
        b=XtRiR8SQwOtHsO7xUH1V3M2lShB5In26zaOkWrnNg45ANEklwyt+99nMXS4WvsFltS
         f+jRUqh/tAvm2hw0jiW1CHHI6dyesMUA+5Zrsvb3nPe2LVSYlcgriGR1HiOKkAc2jCeC
         tLGS4e+kyHvFLjk38bgFeF+iZ4NSDhx9v42wq1l51NCSXCHquQSWeb9bOqWumuXvTYXx
         intd6G0tBfSmd2Yd77v8Tan+/jA6RyvWWm2+fV5ADo8ziu0TSUoApC+H9+D21Z9eRn00
         pE8Q00wrcYnFI25CLzppe9hyNn0NINVvGPt75Q62iOnSHqt28Zs3/57sbOR72OHP2WGK
         KXWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLGTkh8M0d9O8hE2vHZuogmaAE9XJsCqwptjX8Lu0MsI1BWR9z
	3DcmU600kUdV+ov5jmRlnPk=
X-Google-Smtp-Source: APXvYqxfWfvCCvjZn803sAAAfweqt2HS9Vsbr/dzl2ie98sYdPcJchhm4ypqXPE6SigGGTC+OukLPw==
X-Received: by 2002:a17:906:e251:: with SMTP id gq17mr15592019ejb.85.1570261262218;
        Sat, 05 Oct 2019 00:41:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9796:: with SMTP id e22ls676106edb.14.gmail; Sat, 05 Oct
 2019 00:41:01 -0700 (PDT)
X-Received: by 2002:a05:6402:1699:: with SMTP id a25mr19315649edv.91.1570261261373;
        Sat, 05 Oct 2019 00:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570261261; cv=none;
        d=google.com; s=arc-20160816;
        b=KkRKJ7e5vHYdEPTbWzqoAfcqojWDo6P2o/GtyutV4K3zjWaeHnoEE6+8HYIYFaHacD
         8nxu2NRg+7dWjDLRfznBcmh3EG9FYL6Jv8cBCMn6O6LZ+w2gSpbmUxINTbkL9MpYsAAr
         OaO1H49G6KVkju0JXic0KL2HebydzYEI5jCD08iVOCKF4jWtht5b2qzxg6ZF5Jah4P/t
         oXbgAFAdtSv1X397JsAM435y4ESOZ6DUeo2cexjbQziGRSp300DT4FJpTmpRzMb1i8GO
         DWUKt+qu1AXMOjg9JdFB9PokhJsC63hffxsG2AFgIEFM40LohCoCaxBb85Ht00Jz8//x
         /KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=rB83vwjq7IvcOvhI1suElDvAJQz8QSLGwlZ/lG8okhs=;
        b=chtarIWO8QN7IYDO56eTiXeyy5qXeJnHbwNX5SG+q7wjrUiAJbEenC1JA0AgjOQSO0
         Wwks1rv8p89aaCVmCuzlorQBPp8ULq4npbJ/vfmqC//tgoh2rALCk6IT5YmUcvon9kGA
         4jRnwcILwkxzRavjAZt+s7Ridh2oNIiRspdT5c5hgmp4U0zw8/pN5WEu/Apjhb6o8Tmq
         f5ZgKTJDpPR3wzQ0mIDe8UbATXnmdWQlJFfmEcqw56IXsu2+orUngRAccr1DBrKP7Gzy
         h0IXL0eDvvRdN8C7Dcz7OmDyu4ZhZaIZ9hvDrPsFKWWbH10MzIjngE1mknvjbQTsZy+M
         ZX+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RfrT5LYu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id c31si576825edb.0.2019.10.05.00.41.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 00:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MRCnT-1igk1T0gBT-00Ub8Q; Sat, 05
 Oct 2019 09:41:00 +0200
Subject: Re: Increase Inmate Memory to > 1 MB
To: michael.g.hinton@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <1a535df2-e53a-461a-8f2d-ad62b4600a28@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <15e0ae4a-827f-b115-876d-9a80dc07d174@web.de>
Date: Sat, 5 Oct 2019 09:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1a535df2-e53a-461a-8f2d-ad62b4600a28@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J11+uFfOkomOcyJT6g0KxquHZgumSwA5Fzq9/09bC12/TVOm55l
 bGtqfVXVworyind4a4oC/bwItw3nFFx5w/3fDsN+7gXnpzRqHpfn8u/a9uSzVMvBtsFbvO7
 DrizdXVImrEB0q7fb+L7AZIMVXTZNPlV3PoMgTgQ8/iawCmVT0ylItnTLIAdb1jBh5ACsxL
 ViMIjocHN7iEIVJeppRJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u1OzSJE1Ea4=:w1P02iBQcK4vpcqyf5aQFx
 CcHYZ5RlspRcVim6b8Efz7TmMrAa9QZp4wiRalH8MfBsxWJTfdwguAZAK1PsM6+16dZ6H6/S5
 DLER82gg/6OH2128pAY+raX+q/QoE8SAkVSIKo/y5iaFt5B67PLij1IQlEKv7C2rDPGVKB//8
 k/BJen6YwIT/mcGP+2epuX2NNSG3BAz3cezqx0d7iC4rHqz1E8HBkP/q9zRWGO7nxogs861+F
 BYGY3cVZKqGF8J10r17bW22eQtEj8TugH0epZZOmZEGvGFkXVFkEO0EsPObBMaVOwcOtsKqeu
 aeAFJuoZiAnPqvhIw5hCqAMHFZRX/HA1jBc46w9QpuwIklpvFcRnUMXmQF/3fgP7C5JVkVD+f
 EdKu0NLkWMmrVab75c8rNU62ODilxHXJ/kaBsknYFcF9vVXp0gdCng6ae9vZlZJG8HaY3TZ7Z
 237Z7xV3eXSDYm+ihF+uTSknQKppskE3RpzhcF9iSDY4V50gc8woKR11q+n4TAoWeKuSuLlRV
 XdPJCispCKUa95aVWzcgYcaglQPrNZM6S6kS01zE6V9GgUf+o/OAJfMaWGpFi3GBmo/IBpYfZ
 DG7DEasOO0XjN5OURSRHBZqUVDom2yuso2CbaC7omtYQLZP8SLF+OhTJLSA9kI/+DadOGRnko
 shFxJgVMgzPD/jHq9joKTUrCVGepXe2/KoJVz3dNjXgYhDShsDLPLPHFMOVtxsKQZl/ql/62Y
 QiJVoCcgo2LQNfER6OVBjvOgnsLEKZ4VoA7pgD18butaLRo/XMWESUfNVIRBSqvtrqlhH/7ax
 4KXD8Qsn8n0lzVKsXrheoQzlhBRykxih7BDbkguffftHWdmPSqAyzEdPs3XvAc+wuzdI4U4eS
 C2hpTywzZsCz4AHSZ5oOrVF5tqLZDHXOErvs0s6QLqHcS9CQMsfTwy7GX8D3xxxKyNUYj3eXX
 FL+IWXX+JoJ5pe+p3nQl4hsEwa4y4Mqn7FMGAYqrPjSDnT8h1CC9PTRCbstKRQmpOh5UKN7HZ
 NrtOU5a/eUq8glB3DDc1cTZ//xVOlU59StqoPmthC2Ji1wF+0p5vpEfWuYwGfjTHVpOIbPBG4
 4AsmwCcUg0fhkJpJwGTkzLyKySE3hhLqbV/OM4VIsD6soFwByVQKFuTEcIUOFDcMHSZTg4/5g
 99fra+MkxRmsfmRiaCu+AaW4FpvnKJvEgGxctntBAeUibaqUhZsQheoYH4E1EbR5SQGPsjG/W
 H85vqiQV1Fi6z73peQJtf4eFx6PuNCcUNv3lUSfY/dUrYaX/2hgWzwJgf6bA=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=RfrT5LYu;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 05.10.19 02:08, michael.g.hinton@gmail.com wrote:
> Hello,
>
>
> I want to increase how much memory my inmate can use to 10 MB.
>
>
> Here=E2=80=99s the relevant memory regions of the root config:
>
>
> /* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
>
> {
>
> .phys_start =3D 0x3a600000,
>
> .virt_start =3D 0x3a600000,
>
> // MGH: Leave a 1 MB region for IVSHMEM (4c -> 4b)
>
> .size =3D 0x4b00000, // 75 MB
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>
> },
>
> /* MGH Added: IVSHMEM shared memory region (index 61)*/
>
> {
>
> .phys_start =3D 0x3f100000,
>
> .virt_start =3D 0x3f100000,
>
> .size =3D 0x100000, // 1 MB
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>
> },
>
>
>
> And the inmate=E2=80=99s memory regions:
>
>
> struct jailhouse_memory mem_regions[4];
>
> ...
>
> .mem_regions =3D {
>
> /* RAM */
>
> {
>
> .phys_start =3D 0x3a600000,
>
> .virt_start =3D 0,
>
> // 1 MB of RAM for the inmate's program
>
> .size =3D 0x00100000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>
> },
>
> /* communication region */
>
> {
>
> .virt_start =3D 0x00100000,
>
> .size =3D 0x00001000,
>
> .flags =3D JAILHOUSE_MEM_READ |JAILHOUSE_MEM_COMM_REGION | JAILHOUSE_MEM_=
WRITE,
>
> },
>
> /* MGH: IVSHMEM shared memory region */
>
> {
>
> .phys_start =3D 0x3f100000,
>
> .virt_start =3D 0x3f100000,
>
> // Create 1 MB of shared memory
>
> .size =3D 0x00100000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_ROOTSHARED,
>
> },
>
>
> /* MGH: RAM - Heap */
>
> {
>
> /* Create an additional "heap" area of 10 MB to allow
>
> * the program more memory to work with. */
>
> .phys_start =3D 0x3a700000,
>
> .virt_start =3D 0x00200000,
>
> .size =3D 0x00a00000,
>
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>
> },
>
> },
>
>
> And the IVSHMEM PCI device:
>
>
>
> .pci_devices =3D {
>
> {
>
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>
> .domain =3D 0x0000,
>
> .bdf =3D 0x0f << 3,
>
> .bar_mask =3D {
>
> 0xffffff00, 0xffffffff, 0x00000000,
>
> 0x00000000, 0xffffffe0, 0xffffffff,
>
> },
>
> .num_msix_vectors =3D 1,
>
> .shmem_region =3D 2,
>
> },
>
> },
>
>
> I=E2=80=99m then trying to use this new =E2=80=9Cheap=E2=80=9D region in =
my inmate=E2=80=99s code:
>
>
>     #define MGH_HEAP_BASE0x00200000
>
>
>     void inmate_main(void)
>
>     {
>
>     char *buffer =3D (char *)MGH_HEAP_BASE;
>
>     printk("MGH DEBUG: buffer: %p\n", buffer);
>
>     buffer[0] =3D 'M';
>
>     printk("MGH DEBUG: %c\n", buffer[0]);
>
>     }
>
>
> And I get this fault:
>
>
>     Started cell "bazooka-inmate"
>
>     MGH DEBUG: buffer: 0x0000000000200000
>
>     FATAL: Unhandled VM-Exit, reason 2
>
>     qualification 0
>
>     vectoring info: 0 interrupt info: 0
>
>     RIP: 0x0000000000001113 RSP: 0x0000000000007fe0 FLAGS: 10006
>
>     RAX: 0x0000000000007f13 RBX: 0x0000000000001cab RCX: 0x00000000000000=
00
>
>     RDX: 0x00000000000003f8 RSI: 0x0000000000000000 RDI: 0x00000000000000=
0d
>
>     CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>
>     CR0: 0x0000000080010031 CR3: 0x0000000000003000 CR4: 0x00000000000422=
20
>
>     EFER: 0x0000000000000500
>
>     Parking CPU 2 (Cell: "bazooka-inmate")
>
>
> So there is a triple fault here, and it=E2=80=99s just the `buffer[0] =3D=
 'M';` line (from
> objdump):
>
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0buffer[0] =3D 'M';
>
>  =C2=A0=C2=A0=C2=A01113: =C2=A0 =C2=A0 =C2=A0 c6 04 25 00 00 20 00=C2=A0 =
=C2=A0 movb $0x4d,0x200000
>
>
> So clearly I have configured the memory incorrectly. Either Jailhouse is =
denying
> the memory access, or there is just no memory page sitting behind address
> 0x00200000. But I can=E2=80=99t see what I=E2=80=99m doing wrong. Any ide=
as on how I can further
> debug this? I=E2=80=99m on v0.11 (with some custom modifications).
>

On x86, the inmate lib only maps the first 2M into the guest's page table. =
Use
map_range to map more.

Jan

PS: If you call excp_reporting_init() early during inmate init, you should =
get
more proper errors than "triple fault".

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/15e0ae4a-827f-b115-876d-9a80dc07d174%40web.de.
