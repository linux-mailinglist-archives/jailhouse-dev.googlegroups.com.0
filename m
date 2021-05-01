Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBO76WOCAMGQEYVP5PVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA71370622
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 May 2021 09:11:56 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id d20-20020a194f140000b02901c96ae31bb4sf396420lfb.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 May 2021 00:11:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619853116; cv=pass;
        d=google.com; s=arc-20160816;
        b=VfM4SHlfI7AASBTmjjt6q00PsBYH9H7Tspo34+v20m7bQ4KeilvXFB4b8f/WAM7/Pb
         Z5D2RA0Tie9W71t10gfeLkFAQXdiZaiaoOMYjJVkDXBTvoAeI5C6AI4EIOHMyGp5fGpU
         yt7evyQcl3uZjuCcLcefc53HH5e1VKdyTEH8b6Fzbw+8a3ayU7SlOK07jiBn/sv1+CW3
         iY0MmsT5KqaBtHhKx8F9iT9XLSolTuz41GLxGGUwv+oI5+qXCIPSG6RNrldTqr+fhpjc
         0afFr8vGsuf+nA3x91SxiPF2+da+9riUn2sdtgBU6G4k1g5SNAOtPHzX+1b6NClAgvYk
         XfBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LBBAar7sXjV27N/46/v3CXFjBrRPuFdPjHJ1S2jMja0=;
        b=cr9vOvmUeOrO06ygSDzSdcyaoAdUyJnB4p3Y38pxSOgNcndgVXt8GrbjLQvLFsf5bD
         d20Y6EDc6YiMSo3Koe1RIVEvjrZvM70N1FVMQ9v4x8oTAoXqXFP89vE90S/NgKofOVBq
         x07eYJKeXRrC9t/DyVNzoRvyFjQT+iv9DI8QJO2/te774MKbxAtjtC03fH2TAdKS5E3P
         r6mYSZnBJZPnxVAMjTGvZ8IHZiW1rrzTWceeQ4ogeo5mGxjHi3IWZi0LWoEefhCwLTjX
         kPmbPBPICY9g+dXPc1c6z3DxReSqcR3f/tg6e8y2nLJdzgZ9j9+297bML0gXuNAmTJvh
         strQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dqoLkRGA;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LBBAar7sXjV27N/46/v3CXFjBrRPuFdPjHJ1S2jMja0=;
        b=OxEfO9V3JTJ+AIh7wUDFFpt6eYM9xR1UGaZh2dV9m+thEcf/zHueaXMekBrsHfh97b
         N9aNX5V0rxBfPkJIrB/mSHeLNkZNgGVmtJKJlaBR5x6NFm3d0VQ+FvRhNbCtvYmWYYPU
         thTDbM10awWjbbaAIRAm9hA8gfPlsNAQwmz5NUh0cSB/Ysow7/MjDsjAiN5ryfp+dvVi
         vu8JJClIFzb8dyHMWjJI8t3uDGFHf3UJ4U8N+8AG4iXD0YKhUexZTlvuvSDuYhTTiGtj
         oZKf64ffjgB/w8ecZpUE+boMrM2C8ZKtol/zPuSqhZOck5INExShctkA18CjIfNYUOW7
         85Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LBBAar7sXjV27N/46/v3CXFjBrRPuFdPjHJ1S2jMja0=;
        b=ocn7vQ2OZOQ0IdLN8VxqiB8VP6cQ/Eko3EN1t+WaPPRByccTcllzjXQdjfe7Se+nZS
         6Rn/CDBPzRgD9Af2/RpMsKdWJjrchQ8lNc4KFWpNIfv1Kf0KdajZ8s139tAH4sWgkpy7
         UDOp/eOxCDyJAvvMSyJS9bTUeWAsgPfS3yuv26A9OMsJAFc44lmOg23MfUNRyKeTtKKh
         dH6bEjkLI6hOgJEfXbp5j9zA/4cAoPo6pAf2vOul+pnsPz5FEUBdZO2AvMuZWRIwTy9a
         TjnYnYlXMCYUCarTXv7JqlttoE+R/IiP2tyBtfsoNjWkVL/8dfG2Iacv6elyVYRiJzPH
         utaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315RpQxBUU+89MPvkBi7i+EZzZziqAZNqejXxN5vS3XT3IYoyip
	MJum1Jyl0tS/Rnlp5qUGhAg=
X-Google-Smtp-Source: ABdhPJxExrEVdNU4VknOBa7fUWqdb8vm36UXFPRHEN/UNfsvCmKF3n6V3XNzVn+h6iM3MPUmJYeeqA==
X-Received: by 2002:a19:7e8f:: with SMTP id z137mr6108290lfc.466.1619853115825;
        Sat, 01 May 2021 00:11:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a02:: with SMTP id o2ls2384304lji.7.gmail; Sat, 01 May
 2021 00:11:54 -0700 (PDT)
X-Received: by 2002:a05:651c:14b:: with SMTP id c11mr3197212ljd.303.1619853114805;
        Sat, 01 May 2021 00:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619853114; cv=none;
        d=google.com; s=arc-20160816;
        b=feAMBtS7+Ua5W+HXUoTiJF1Wmna8oerb0tp+xHXNVXrPAjVix2Ctx6meohajqkiJ9f
         WrIEhOI+lxCYRI+X9qGIfDDwj1RLSODQMrxNcgdwPyv6eV3ZGOlKQ4SGpJNqcImY9mR1
         SyKRS4g8QSCWl9W/qt3LS8dmOccFP3AEN+oorHrhkm743dHlkN3dIKK+Ecb9Ke66tghv
         XP9hs1XTiFcDvJVx069+Ti+EYB3J40H3U8tDXO7fnCsuu2e2DfPTupQC2h7Bh3TF2xTC
         ptwgOjOnXWw0czhZtA2DKsw7PMY/0C9y74cqDl6c84fKzE1zhA1wWthSL6lFm/uLCOPt
         eB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=DwKhXSfGmc3pqCjKlXkri9/JgViVePXgmMLquS224u0=;
        b=T9ReNjP1be8U7uFOYGq2g1C6H54rsOBmCsDB8e9LdtWfOpF6mjJ7yTacGjQuJqczh6
         xt3pARUTo4jSM3rHdt4p7IZQG5D8ELQ1CDAGraQfXW/c7WNNbqYbL+ObbC0QUaiM2XPU
         PJFR9JygIZDLUYoXOTyR2m3MVpUav8BKAhZYn9QRPlsUSSaK2kYrsGP0WFUJCA04d2xu
         XI7hLrNlwjdt9abWtbFCEMTzsBedZDhBYsEV1Xdwa8ZqWjXQrWntspUKMaO8Jk6FIOsA
         Zv5Q8yH5HPLpjJBHJZ095TN10I+JYwZnGHZFh4LSlgQd5mQ7upZaO1RcCGdE46sKTSUo
         MDrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=dqoLkRGA;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id d25si432055lja.2.2021.05.01.00.11.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 00:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LwHxK-1lVJdn1uLG-0182Gq; Sat, 01
 May 2021 09:11:53 +0200
Subject: Re: can none-PCI devices be partitioned into cells?
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <62da4e40-0182-45bb-8944-eb26fcb14456n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1f70b1bf-63c2-0f05-bfd3-0c5ea0225a11@web.de>
Date: Sat, 1 May 2021 09:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <62da4e40-0182-45bb-8944-eb26fcb14456n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:byMjYB6aP07xYCmDfZ4SxeIwzg19rxJAYMasdE/SWjlk18jhHz5
 v7BjtDqJY83sHY5M0jYpIAFDIqr3StXgVYNWpTB21BxIclcnkG1VwqY/IzlJls6nsuhQs/y
 km4Me9wItMAeH52xz8kPusr7frtSfcVnQuHBuR/GkrC8KmWUaNs9BvcoEcThhWYj9Bw6CXy
 Nb3adlwh1OHadCiSXUzVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ybx/BaezExo=:RC7j2NuThMbk/X5apezhri
 je3NefoppJemRwCSCQRr6ug0UJYLXWRnG6ft6Uf8lQPbIKHygHxrH9Eluti9hBtTJNy1PoT7d
 GS0pTrR/aTJz11p60sT3eyMYwP5r9blQA/nf3Bh+vkk4DkYTtQ46iumYhRAbeZaAv8bbdXARQ
 j+UCrsfvAd+HVSCRbLDCQUAzThE9ir3y67XFrzEI3eZSHdYllwhVYqtJPjd/IawHJyE3QRY3N
 os8IjM0DbmRtj4iW3ud3A2trftxwK7kQwnefnEtZ9rIzXSkwACmV1Qe6eHy5FJE26b3KRXTwp
 zeLH2KaTcLiSdL4kNe0GJe+boVkPr1xQLCsnLvhdvXa9tv46IiMudwPDxwEyuPc1St1+f2or7
 IxcOMT0eKeqa2dv8+dqzvtKSzWU+BKt+QSezC2/L3XgH1/Ppr5FFlXzzTsc2wn2yY5F1zQjWE
 5Q5SAg5BarMlYW5dR/OSSgftj3iR8f8uph/CF8wFPO5cQtXR+sqRfcDiWTjFCd3S4KeZZFSVO
 ZG014amsgwQtMkTPBWmECGwVgYjfHg+zB49oP3Q1SxuU5uZZdMyRU2hqXnq5hguJbEgHoXAsB
 uTb+INKAGkCwt+O0nxnAcwljuuW8PP6QIesXTbbIWeC36r1XeGZcFZ99QYYw0xFp3K0w+KvW1
 IWX7TSXc91pgo8jvwfT37hkzbQdXpsiauPFC6tySDBEAcOYan2Kxi8+eJetKo14rzjdm3fCsp
 LN8DLAWa9/b+Dq49I6WHAMb/Agb4ZV1EU9gI6LpjbrICP41AgsYdlZeqynk6EOdZ2xKyJx3F5
 KFxL3e24lW8h5gWXuPRSFCu/Gz5Z6M56bHbuEwADFjIXI1jmKaFCZKWBbMCRdtiX5ugDOh55/
 rWpGoB/oeLgHeyDWH10bSuK/mcnnj1lLsOulEMz7SE7IDcyHfSKi//eP4F716Lwy8qRCz0cV3
 N+4Oq1ws2I9PH8gBJWoLh8xhLhorpIajuVfvnRSXjWsTciJjwTmQ0lrGcsHY4KO/dC7g08FmP
 tZcjhmUo/Xfub+VLzTM8Mua8F+SdpDdD2rWWgDowUy1zDlMMy9xfez14RLMzqTw70gYL2LMu/
 JRyFqPwbq0vZNIVTc2OlPbq2JV3yJUasXx0GXHrlB76pn1vX4sSKzmxbDtF6ErvpnTsbRMCYa
 4lHSRZ7d/6JTjuvVhrgGaPQmqqLJz6KPl9OEIPDr2nyjLON2RUo+wpI9Y1gJY2xapYJX8=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=dqoLkRGA;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.04.21 04:35, along li wrote:
> PCI devices can be partitioned into cells, as we all know.
> But=C2=A0 some arm board=C2=A0 don't have PCI=C2=A0 bus.=C2=A0 The device=
s is=C2=A0 designed=C2=A0
> into SOC.=C2=A0
>
> can none-PCI devices=C2=A0 be partitioned into cells?=C2=A0
> for example=C2=A0 network card in raspberry pi 4,=C2=A0 =C2=A0 Can it be =
partitioned
> into cells?
>
> Any=C2=A0 demo or sugessition is wellcome!

Yes, you can also factor out non-PCI devices and assign them to non-root
cells. Platform devices generally have MMIO (-> memory region) and IRQs
(-> irqchip) as resources. Identify and add them to the non-root cell
config.

The only challenge can be managing clock control or pin muxing for such
devices. The control knobs can be located in devices that are hard or
impossible to partition.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1f70b1bf-63c2-0f05-bfd3-0c5ea0225a11%40web.de.
