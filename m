Return-Path: <jailhouse-dev+bncBDLLFRUURMIBBO6W3WGQMGQEDVAGMSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F84730DA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Dec 2021 16:48:13 +0100 (CET)
Received: by mail-qt1-x837.google.com with SMTP id o12-20020a05622a008c00b002aff5552c89sf23521872qtw.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Dec 2021 07:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w20rQG/F1Pcv5gjlnUrCYva+EiMFOqo4qjZQCvo6p/Q=;
        b=D+t8wU9Dt5WWnfrl/MHQUqVptNCsyZ5T4EoLmtCY+uo6XfcdYF0hhEJ+T8k6F3bxIJ
         fyA+5rJ4dqRAhWOlRM/pyQlOtobcv7CbVeF1kFAl1Fa7FEt7dg+Dv4cmISVTTTWcqGtW
         nYgUq6hFktVhXc8KcfgbvIajSz+pWKe4k4cNrwpDdiOMU7E14q4tN+d2MtRDX+utllWW
         hfCs8e0qD4CKyKqPlwx5s9cUX4kPio+P/Ny7BstkxxPMLuVdYod3B+lYqYXFPZne6dVX
         JgPbCryV9ulaYYZvbYHR/JmULPqV0oqKt/4XwQPzWdvBbhnee6pqoVY1rzYeJOr10ZIm
         z/rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w20rQG/F1Pcv5gjlnUrCYva+EiMFOqo4qjZQCvo6p/Q=;
        b=SLJLhapPnayOa+v9DJOcxYDgyjdye8PbvmtLM0I2UNCO2bJTacQwfCcaLDyr7vuFIM
         2330UiRm5p01QI7ur4JfSptk7Bg8xJniBj0WUe223wD5OftPvOoJRe4r78qrziwMTmeI
         iPIpXf/GVQFfoYGjZISUlmonSbojZpdViff+XIikLwy0UjTJ3rxQzEUBAfIS9e6uqPyU
         SWAifNUE8KByEvJPgRwo5i8B7ivraMx9t7iYG2aVVwlvqRgbviC7qaannGKWZzcDPr0v
         9O7F6CAt/NO+k2n1lk4pVqZbbCDsu4XLlSLcUsJW96DeFZc0302+lRPVpJho8kZ7rNdp
         IAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w20rQG/F1Pcv5gjlnUrCYva+EiMFOqo4qjZQCvo6p/Q=;
        b=CXYq9tg1U65N3ygIIadHqNxe8/KlvmSIV+iQw/RUu+ShO1Qw8jrdr34mma8l5oYvLi
         QMuiW/qln7VSXUPdpUKq1C4ZCwfFDM2dTI8p6IPUqGlr4Hb/zFCdwjq9fnLbdt//FLTo
         mdsdhcO43/KAwNT7UGqWxWq0wTSfij1e3Yy71fS09OUWSoAQgGKgj6XfHvsognUM6Irk
         1Fr+kwKdPq3nbRzc8VJjWBqhgWXsCp6DhSMQmiYkJrjSl0tMNxBgt4LWk50rqsbZAjUp
         xtORYlFGgICOl4s8MYkrFSyCmuRRZfFAhAXu7wqWnKWFWxHpVRhMIHPCJwsW9aTuR5A1
         1Ldg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Zge12/qpp1qyq9VYqu81ecS4ZFr+vsKyGNde8nLEQLZpdFnUt
	L39VjeR8pPd2D0wVrBiu3tE=
X-Google-Smtp-Source: ABdhPJx0T6Xkb4icONpUQX68pP8H9stb2FL/sT0YBQHlpTbCDzAN8fIjGHAcPUyHasgjMTQymbzykQ==
X-Received: by 2002:a05:622a:1196:: with SMTP id m22mr47601540qtk.290.1639410491857;
        Mon, 13 Dec 2021 07:48:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5c05:: with SMTP id i5ls12841871qti.4.gmail; Mon, 13 Dec
 2021 07:48:11 -0800 (PST)
X-Received: by 2002:ac8:5f06:: with SMTP id x6mr46134698qta.549.1639410491236;
        Mon, 13 Dec 2021 07:48:11 -0800 (PST)
Date: Mon, 13 Dec 2021 07:48:10 -0800 (PST)
From: Anmol <anmol.karan123@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <09e503d7-c00c-4e8c-a10d-4385d061b0ben@googlegroups.com>
Subject: Help Needed Regarding Virtio IVSHMEM
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6202_1132538160.1639410490662"
X-Original-Sender: anmol.karan123@gmail.com
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

------=_Part_6202_1132538160.1639410490662
Content-Type: multipart/alternative; 
	boundary="----=_Part_6203_1443683134.1639410490662"

------=_Part_6203_1443683134.1639410490662
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to get virtio-over-ivshmem working with Xilinx-MPSoC(arm64) 
board.

Things I have prepared/setup:
-> Collected the patches of virtio-ivshmem from `queues/jailhouse-5.14` and 
applied them to the `xilinx_rebase_v5.4`.

These patches includes:
 - uio: Enable read-only mappings (with some modifications, as xilinx 
`renamed uio.c -> uio_core.c & unified into uio.ko`)
        - WIP-ivshmem-Add-header-file
        - WIP-virtio-Add-virtio-over-ivshmem-transport-driver
        - WIP-uio-Add-driver-for-inter-VM-shared-memory-device
        - WIP-tools-Add-virtio-ivshmem-console-demo
        - WIP-tools-Add-virtio-ivshmem-block-demo
 - virtio: ivshmem: check peer_state early

-> Cross-Compiled `virtio-ivshmem-{console, block}`.
-> Added common shared PCI devices to the root and non-root cell.
-> Root cell contains (`uio_ivshmem` driver)
-> I can see `/dev/uio0`.
-> Non-root cells contain (contain `virtio_ivshmem`).

-> Also, after loading the jailhouse it's showing PCI devices I have added:

```
Adding virtual PCI device 00:0c.0 to cell "ZynqMP-ZCU102"
Adding virtual PCI device 00:0d.0 to cell "ZynqMP-ZCU102"

```

After testing it, I am getting this(even after cross compiling the 
application):,

root:~# ./virtio-ivshmem-console /dev/uio0 disk.img 
-sh: ./virtio-ivshmem-console: cannot execute binary file: Exec format error

I am a little confused here, please let me know about anything I am missing.


Thanks and Regards,
Anmol

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/09e503d7-c00c-4e8c-a10d-4385d061b0ben%40googlegroups.com.

------=_Part_6203_1443683134.1639410490662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div>Hi,<br><br>I am trying to get virtio-over-ivshmem working with Xi=
linx-MPSoC(arm64) board.<br><br>Things I have prepared/setup:<br>-&gt; Coll=
ected the patches of virtio-ivshmem from `queues/jailhouse-5.14` and applie=
d them to the `xilinx_rebase_v5.4`.<br><br>These patches includes:<br>&nbsp=
;- uio: Enable read-only mappings (with some modifications, as xilinx `rena=
med uio.c -&gt; uio_core.c &amp; unified into uio.ko`)<br>&nbsp; &nbsp; &nb=
sp; &nbsp; - WIP-ivshmem-Add-header-file<br>&nbsp; &nbsp; &nbsp; &nbsp; - W=
IP-virtio-Add-virtio-over-ivshmem-transport-driver<br>&nbsp; &nbsp; &nbsp; =
&nbsp; - WIP-uio-Add-driver-for-inter-VM-shared-memory-device<br>&nbsp; &nb=
sp; &nbsp; &nbsp; - WIP-tools-Add-virtio-ivshmem-console-demo<br>&nbsp; &nb=
sp; &nbsp; &nbsp; - WIP-tools-Add-virtio-ivshmem-block-demo<br>&nbsp;- virt=
io: ivshmem: check peer_state early<br><br>-&gt; Cross-Compiled `virtio-ivs=
hmem-{console, block}`.<br>-&gt; Added common shared PCI devices to the roo=
t and non-root cell.<br>-&gt; Root cell contains (`uio_ivshmem` driver)<br>=
-&gt; I can see `/dev/uio0`.<br>-&gt; Non-root cells contain (contain `virt=
io_ivshmem`).<br><br>-&gt; Also, after loading the jailhouse it's showing P=
CI devices I have added:<br><br>```<br>Adding virtual PCI device 00:0c.0 to=
 cell "ZynqMP-ZCU102"<br>Adding virtual PCI device 00:0d.0 to cell "ZynqMP-=
ZCU102"<br><br>```<br><br>After testing it, I am getting this(even after cr=
oss compiling the application):,<br><br>root:~# ./virtio-ivshmem-console /d=
ev/uio0 disk.img <br>-sh: ./virtio-ivshmem-console: cannot execute binary f=
ile: Exec format error<br><br>I am a little confused here, please let me kn=
ow about anything I am missing.<br><br><br>Thanks and Regards,<br>Anmol<br>=
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/09e503d7-c00c-4e8c-a10d-4385d061b0ben%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/09e503d7-c00c-4e8c-a10d-4385d061b0ben%40googlegroups.co=
m</a>.<br />

------=_Part_6203_1443683134.1639410490662--

------=_Part_6202_1132538160.1639410490662--
