Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBB4UO4GBAMGQEJQJ5JTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CE343A92
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 08:29:55 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id i5sf25564720wrp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 00:29:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616398195; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cf7ZVP3JqANmTF0l6pmq2Uxa66VCwscOtDGhm48KZ5ncFFNkrTjpK9Hjg4PWO67EcH
         p/e7Mgh8eROu5fDo23lwZdyjHKJfARXKFaFux/minNZBNKsSeK5/fphnaXRb7tMYhBCG
         5Jgetzwuj3Kw1h+inEKdCRuNsHtcgqXwPjxD7y8akEYfbR+rU7Na4sG1yuoNO2q1OjIR
         /hIGtzk7eAYrthXMpjtCH8TAZqJaibXCveU5LtW+nTHXXbg7I8xqtHewTtskiFQ20C14
         9UwInK3IfxVZg1yu6A6bW5jE5EnFH7pHCR7FU8OogWZO+2Wj45cSabRlHKSAKRrM6Un5
         98cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:cc:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:dkim-signature;
        bh=aFY5aHNpT+DrW7zC8GY6W1/MYehKGdL+9Axpk8GJfKU=;
        b=UcV3MOBWvB70FnE3wRObT9COoMGnZoKaV2JjjWPb2emZcbavN/qKisqmiHueR0iUuc
         3+joOy4s4yO5mCN+wt3giEo/X+xiC7uY1NIfnfZl9q4hFL1SbXdD3ad2d4wHpDiX7iZA
         HHfRMjrvUteeVf0LO/2JViH3lnd98yZQXkYnidLJntdfQOzjBGZCtrUARnk0neCnmdMj
         wcJeuc/EcQOBBKU/UjA7LeEdpJgBuL0BmhEdkxUTReywb5rSjlJaLC43ZhfQGCF5wMxB
         ahM49O3mNWj72WhQiRy8h7D5vf7DgGhw9bFOA4V+M9LuZyJl3PpP9rTfUoMKX3lJ5g6i
         wHiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=deRt9Xl+;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:cc:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aFY5aHNpT+DrW7zC8GY6W1/MYehKGdL+9Axpk8GJfKU=;
        b=ka/sX2Ee+w6Jq47N1eUQaYGe32aiKubpr1vYjOAxSKyRub815HcWaqZQRvGS/6eQVw
         MoupE7IaGbNJG5d1A4PuizepHu735RZ14YUqXktip/0TYsx/x7vk6CWtyZk9KEDrRN5D
         MkSQuewNtDAzdhj3SVbokLw6airL/Aeqv3gC+6NdaTaT2bGFyIv8orXzdZQeN/aZLAHH
         +oIp2w4RXC+SdvX1TOYg29P0RnXUlejSg0jqE1idXFo65BHzl2yg5hwuXeCR4RKz7lC5
         x/CWCDz6qAnVgCVgMU3rTjwXmclIY1Ge3TA//yTE5jRcIySo0fjeaRtw+msk9weOc7TZ
         9rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:content-transfer-encoding
         :mime-version:subject:message-id:date:cc:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aFY5aHNpT+DrW7zC8GY6W1/MYehKGdL+9Axpk8GJfKU=;
        b=Hr+kqEMPMHJzzlwI3EwOr/Tfj3AKy0VLmTswAijMZoff5ibHs1C/WH7RA1Lqu8GDzL
         wserk27ZkjElAriyYnguxxHRFV/ekFZSsXPQl407dUxwOeVGZj6cE77r+95W1v0t8SYP
         oTsfD95Tgehdr+5GGcl+tiKe5giA3lQcn4NokDqJBYM2Hu/hDKRn8TIK4fKaqFNa8kqm
         NUrtDwAbvf6Un5c4HgkyRDww7RgoDXQtln8nyoWD5ruMOVc5JbS6E8jfAYdYcN2TwiJG
         FM0WAeC1H+zsj8mh/W57h3fpDtEtDeYSB+q83Xw54yRJy6y+UR/ErH8QTEPla68T2n4L
         PwDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530PtJ5yrW/kpn/1r2neBznuz/8C/1YIBLxEt4UTLsJA+whS2BtA
	fEaZGZXotNFJs+MAhObxTKo=
X-Google-Smtp-Source: ABdhPJxCma4QzJA9ZZUZVhacMKcSJVIG5b5LHmNfHxqPOVDZ4rxkxShkDvlxXJ/qK+2Tprgll74r1g==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr14437305wmy.56.1616398195182;
        Mon, 22 Mar 2021 00:29:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ce14:: with SMTP id m20ls5578579wmc.3.gmail; Mon, 22 Mar
 2021 00:29:54 -0700 (PDT)
X-Received: by 2002:a1c:7714:: with SMTP id t20mr14363834wmi.107.1616398194222;
        Mon, 22 Mar 2021 00:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616398194; cv=none;
        d=google.com; s=arc-20160816;
        b=a2a/obHMONlspGXBHLy5ylDA85BIJQULm9yynaSJlG4gxKbiGCecQx4BNeH6DJeQpg
         kUzv2Rf4MmnsHstyCrDhf8qh2jupjJDb6zs6x5YyTZ4IjppP/rdsco1gvU14nYM7Dxq4
         vvNJC51KA/ua8Fs4lH9869aSZiXouKguiHD7cwWl/YSluF8wxM0sI7HrV94EtahWJnOe
         XAxPnMFP8X6c/lgoEi/1Pl1i57IerDuB4ZHPu48GETJw20VXuGwcsHkfVU7E08sn8X+e
         n4JiZoy1mK2/hJC165HjG4XzMVHH+dhCKh3jT41rZ3+EJeBB68cz9mFApnn53BJexTX/
         xElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:dkim-signature;
        bh=hOFBfp/TXS9O6E4i7DSuaS2gE11uQGYerAo/1C78xiA=;
        b=BNjVcdwv7OCWH0f2GktT00htFU9l+2K7z6Y3WdbqwNh3zcrc+ewoBCG+fCrhgN3MmF
         nh+C9mz1DA/H/RNPByHyc5mojsWQXUp9CJ4PENBRFmxMQQP5sMm4URnBIKxQLtmOUHwn
         WnR1REnfm89G/9iMVxT7QlDJ93gazf224uPH5AFuJNJw/Nzu5/Kiz4+1rLItrTt6jg7O
         T3ys30tepnYVpoaynbLdU0uj0lcJYt/wZMknINXgyz+prE+p7UMme04adF26itBQIdkq
         Zd8aHGGJjqdo3zT4peG4UMXZFo9KyBeck0xY1FhkhG0wb7dHxsMGEVFmK+yVI5baNp6G
         aF0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=deRt9Xl+;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by gmr-mx.google.com with ESMTPS id w2si476587wmb.4.2021.03.22.00.29.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 00:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.16.213]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1lS90x3Inm-00H6SZ; Mon, 22
 Mar 2021 08:29:53 +0100
Received: from [192.168.2.26] (unknown [192.168.2.26])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 47EF3213AA9B;
	Mon, 22 Mar 2021 08:29:53 +0100 (CET)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Root cell cache coloring in jailhouse
Message-Id: <24D2D568-5334-4B88-9430-86F84E576E35@gmx.de>
Date: Mon, 22 Mar 2021 08:29:52 +0100
Cc: jailhouse-dev@googlegroups.com
To: Andrea Bastoni <andrea.bastoni@tum.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Provags-ID: V03:K1:4zQ+NFtK32qW7fDAqObskeN7Tv5BMVHyFnYIS/76s/Zq8hVgQGZ
 uozv8BmQCcb4e1a/Uwb9ZmPTrNEUawOWa7W4dcuZKsFJI47cBs5sMfM/gK7Li06qZ8eV1US
 +OuLq1DF8zrx0gk7npToBJTLPwGyIQ016NCBY4PZtcc6avJbozUp4K6Cq9qH3PvoocRfsnb
 Wr8CUi5AEUUUqWgH35khw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bci6UQFkYtI=:FrWaJ7V/88Wvjm1qlpypfP
 At0tVbwUZ6gk5UVhy+KLTAARAo8k1PDG/vnFHEvIZke9ukrB7AjSp2YK7fWUlrROVNgT7KnW5
 XlnJMi+4t/D7Pam7Oz4BVrJOjPxvhJdP0CyAqTNbL/zyjr+2/7F2tvpV1jl490Zg6qfTQzd99
 dvTiY7dIiI1in19wkpBhlFLV7H64aFMW1zcAxwIKcO1A4mfoVdP0Zhf1m/VFQEQ9NMJ1nliK6
 I9YGpKxiiukgz6LVVhYiQPE0IYPKoOYsn59QexNaIH4FcRWcy+dgSmenfBYjViCAFmq6wsh50
 rBstx7siwJz43NT2sDs5ovm+aGYWYnYkGD54d0v7eNlLhH9rIKsj8gum2vm/qKn0CiG4YhBQ+
 YzdjuEBtdGH9jCzhNN5IRmbweUhOPyRon4X93KcQ0nVugOodHPK8Y4rmoKzgw8qKwCc2/tvJo
 9+we0ZclpLHMmVlf3mSOqGi5bbCQD5PNnxYpUhAX/888C8Os+RtBP7iVB8O4/qIHJy/37vMjZ
 a98oIh1nUXF7gHKS3BTKzI06vdWe6qwPlJF90bAa3L8Hnvr7k2Ebx6pPFv3JoSOabPcZjUFpu
 Rlf+Tc7rqPjp6urIo9jz2lYlFWqqlUGMtmgPK8DdX0p/ylyLKYKRR49pBZHYQaxoqYt8K5Ann
 Yff6ftHVLcL4m8+2ZSjmHYPm9Wpb4UxqUSQas3LPuEJzaK67UC8ErSjEGX/JrTxcPdPropf9R
 MzKK1LQVxDVitSOhVbOtj2qqfbABEqYwU7GzwyojqfDVpVuMFsnkjB9WIugNaAD94VN66Vh6M
 OGyFIkC+nccqo0Q0r91KiN9iXwprwEmX0Bzr61k46bK26EgIu4rKjNHYyMR3mFpSZVT/ouqvp
 S25mslrFFG7rznlhXDrDzWhFTEXLlQvKuBS1xCdQ28Y+LXAECG0Vv6N/RQH+hbxyIVv16EUSU
 AVFtvivD9wzWTzH3jm3Rzbl+6T1eqcQz4yIzJnJl4yYy1Y2aYbzxVKPrdqyBKtZWD7Sji9NDf
 gntOHrvXpw13lRAyCfTOB65RQBaPDLDLw0r48X2np3JQ973yQVqekEECof/c74y2WDjQvf2A3
 h/Q0BApEVWkKMQqHk51mhPI/+q8OpuORG9lfaeMITU0WAyYzgkUnAuunSwwQQ3UOpArg/Wgb1
 +zOgRk4f58qj1WuC1+bNvSdAFOoBm/Ru5Wibm+b4Ou3IDaqBLs6f9RDxvWXw9WLL4Gh7RX07m
 Ywj2sFe7UsfLLCsfu
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=deRt9Xl+;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.20 as
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

Andrea,

I=E2=80=99m currently evaluating the benefits of cache coloring in jailhous=
e.

In my application I have a setup with two cells, the root cell for communic=
ation purposes and an inmate cell for a realtime application. The system is=
 running on a Xilinx ZynqMP. With the arm64-zero-exits patches the realtime=
 cell runs without hypervisor exits after startup.

If io load in the root cell increases (e.g. with network traffic) I can see=
 some impact on the performance of the realtime cell. Possible reasons migh=
t be bus congestion or cache conflicts. Since I=E2=80=99d like to minimize =
the effect, cache coloring is an obvious choice.

The current set of patches for cache coloring doesn=E2=80=99t help a lot in=
 my case, since only the inmate cell can be colored. In fact, the performan=
ce is worse than without cache coloring (presumably because less cache is a=
vailable for the inmate).

My question is this: Is there some prototype code available for root cell c=
ache coloring? You mentioned on the list that you had done some experiments=
 with this. I=E2=80=99m aware of the limitations that this may have and the=
 concerns that Jan has voiced for this approach - however, at the present s=
tage I=E2=80=99d be happy even with some hacky approach (be it in Linux, U-=
Boot or Jailhouse) to investigate whether cache coloring provides a benefit=
 to my setup.

Kind regards,

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/24D2D568-5334-4B88-9430-86F84E576E35%40gmx.de.
