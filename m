Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBJEU53VAKGQEIAEHEVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id D5883956DF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 07:50:28 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id q27sf1018414lfd.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 22:50:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566280228; cv=pass;
        d=google.com; s=arc-20160816;
        b=p/WC47wIAhXtkcBJt6rMj1ghys16ai2F2T1S5yNMgxaOVnFEfoh48ttCYeKoVe/v55
         iTCtArE9fwTus3rhrtEa1s3TLSxcSXyk7L3VI6LfugIIpv3VbooHUcCRkeNnnftSr3dc
         dV4trR0FNWVLCrWTst6YaYk4lZRSzMfPYCwKluuxa3GaSC3YHUfD6T6fWL3tLf1RBc2M
         15l2z0+5TG4TR6GZOElZXgigu0yxo+28Yc1I5aclPgnWdAwfLqcR+9De6qqxxV5IFtQX
         m4X+CQdOPyBIHJJ8A4RJRq4zjp8rCUCqSPIujAqcZ60fDkr4gez+GEnJ8ejFREDMWO8R
         QcBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:date:message-id:subject
         :mime-version:content-transfer-encoding:from:sender:dkim-signature;
        bh=TI0rqoP3R7IMEnsVSmaPb04usXd1EDjoRo6Yue2X5s4=;
        b=PoaBTb1R3rfodtythSoIID7suQ8d0Ob8ifHW3EN+XPv8z82izhdF4IacUxFvHppQb5
         oPphkq5MysgonsBn9erEt8YCRPBVpj7jmZd+9R2AHbA+BbmQjWAVb8o/n1KTneknhJgQ
         gabMAbDEl1N/MBefVWtVFkW/KaiRG0rcDzCvBes0+DMJ/6UFVygRfif8BB+iFQUnpGm5
         Xe45w+qEgDqMgJUu3m6kh8gE/cPMQRmObtEM6tFNBG1n/6SL0W7IUhyH1i8f3Vxp6Ml1
         jq6ejxaN0QDo2NJ6ObTWdWpzTcQBxv7s3rk7WIgl6Mgi4kbyNHaUWn/JqDCXD3pmveH4
         nr6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=gz72W7t2;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TI0rqoP3R7IMEnsVSmaPb04usXd1EDjoRo6Yue2X5s4=;
        b=P4DzX4CsqmqofvxBLoKgaRD+hLaxirf9I7z37DLzlvsFUWkArxguMP+/5C3/iVaVp3
         YkWt9aMx+FPie+LGgA7iyTnOl+aHdm4hvsqbVL7Tl3Tob0uUaQOUpt/vLuqqXa+2u+za
         0zoMNhZKbe+fW24PwM/HwjRNHWShhI1DcGxg1Y13DpW1RI0WR1NFUcJFKr4DjFUTsequ
         GW5u4CdVfZGXSdCWwKjX8RwVI/0Tkiev8iJy7gDBlXjMtjyswm3eM5/OUwqDV/ehlkq+
         q8Rwk9B3mKNQUb52yFuMT6cL36jZo2Z5ljdodfi4pqMCJmq3K5sI1dt72IVGzbT4L4R2
         FXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:content-transfer-encoding
         :mime-version:subject:message-id:date:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TI0rqoP3R7IMEnsVSmaPb04usXd1EDjoRo6Yue2X5s4=;
        b=UH7AbOtMDhhAIjFFtrnseZrcCHVYfCOOlSzp4kJMvc0UTAqIoLEMlHjbxGKO11Obio
         iBMsZyn5RxD+OZAq/ibrWvHrVYoejAFETmgVGlXFReWsnDmlnPBFzNZ2dkkcogv5qgC6
         94yYxf5gcQGmGUPapj3elhaEm/bYuVzYNTyJKbHCOq8oYXF+0zUfVQzn2pc/JTrGz3Ye
         06MugBfDthCX+DI4R57nOOEcQsDDDeEWCHhMlLxjOsan8fWEwE6/6qH++1fBw9dtVYUm
         2X6eE5UgsZbyi9fSSDbHnRptjHxuOQYlFlPpCBelWtwVj0lf04WK0kPtFE/Lw/qHXa9/
         lrug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPXkVmIp/r6a0Clg9csCZF4OUsD3G8+1WXiXffmzO9cKCoeQ+C
	ghBDTxyIfhzp/BnSxv3lLzI=
X-Google-Smtp-Source: APXvYqyRM88Lgckm+9ExWrKCrvb8fmK32GHl92Pw5FrIuoB9Qb8nZPGCWtJ+p+PxmKfcIBUddyEcJw==
X-Received: by 2002:ac2:50c9:: with SMTP id h9mr8420559lfm.51.1566280228495;
        Mon, 19 Aug 2019 22:50:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5053:: with SMTP id z19ls1560614lfj.7.gmail; Mon, 19 Aug
 2019 22:50:27 -0700 (PDT)
X-Received: by 2002:a19:7006:: with SMTP id h6mr14153488lfc.5.1566280227604;
        Mon, 19 Aug 2019 22:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566280227; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1uiflntvYxXXV+D4Dgm5GUkewrp5gcnDVRnaCaomnLAz7YrocwaVTLP6/eQBb7hx6
         HtNsmotn/DoBYhPpmWvsLk/Lc/up4VvDoYGLKFHlfpqjfb99dHG5b1HfSgxYHYQR6pG5
         C3dIv5MP+uewnCKDW6nmnPdbegUdVw45SWSRP3HL9YtwRuQtW/v7OpsQlmFAs2aGZNGh
         LbKGq3A6rzAtvfNQT0w6dLFtT6lhzXMy0kzZD7hC2mh7mhQt7khRp1pZ1U3GPLQJ8T4y
         h+LLDIWLqRXfMQV1T4KJK9aKqJ6kzqfM+2Q/JPjwb9VS20IICOE9PuvxTm8HYgT0WtV6
         6Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:dkim-signature;
        bh=Hxt3ZgCKUGXFWaklH4pXsHzo9rZ6gRiuHt7hjaeGj1M=;
        b=YNEY6YT52PZqaExB6/WsRXT9crxzqksSZBlufzfTKeagM6YSJ2MbTyOxES9ZS9AwGD
         T7UnB5eNFGZz+dGpKrUdKtUHDH9wfwcqx8BWdZPisVU1ZTvl2mWLPaLU1cqVjQLWeYRq
         0IkHotmnRTrrpb0PgLF+7W/Bpj0JiThrMKDGOO/O0NkatPSMSARPPrpCEL+axyTTOT3Q
         uThbMDwZTQkM6BC8t/PC1jjtYx5ODBkA09hkJ8jzxkj9ts0DswuDtk9vMk0Y5IZl9n7X
         mNQpZOvnpCAaGPzdCprZlmbkG5oEMm3hLjEq69XfM56URHWskCxvt6hgGcljVX5H8VyC
         dkjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=gz72W7t2;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.19])
        by gmr-mx.google.com with ESMTPS id f26si673033lfp.5.2019.08.19.22.50.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 22:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as permitted sender) client-ip=212.227.15.19;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.213] ([212.126.163.234]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lz3rc-1iLvve3YES-0148Lo for
 <jailhouse-dev@googlegroups.com>; Tue, 20 Aug 2019 07:50:26 +0200
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: iommu translation table length for arm64
Message-Id: <56296140-3149-4CD5-BF93-0E27EDE38819@gmx.de>
Date: Tue, 20 Aug 2019 07:50:26 +0200
To: jailhouse-dev@googlegroups.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Provags-ID: V03:K1:Ebm1SmaaGO7zzbgT0Gkt+38qwByBlcyeRVjhB8g3GuzTKBwS/dO
 sD2OQFtp9CRChHkAP+7aylLFRkjfvuOwwShb0iE7w/SmZGqZSAzSyup2O1i5Rs0cgX3ltVU
 EWS5X5OzKD0guFNvrswoIVT9lAp5UzPmHfiGEyaTOb0xhyTzi7zeteb39wQduRMR9b4lEX4
 4+DrXJ3AHaY5IgnJEdQPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zqa03Frkk1Q=:JenIRWOam1FXULBu8sN3CY
 dL/ysz0PUtROsiq5UVN3lhl5EoKYso5WmtEB3yxRRbTk7bqElaSuXhYK7ahu+SpP6AFZ7eb2j
 odOb8eumErJsZUXt5rHCEJjXv1UlNI+z7tn/S+SaKnakWaUaJGR0mI/xEMhGJkS6jkm3Dg9Np
 xQCaypH1FEaBigSqQwgpUlceTfXMgvAnyDN1h7n2V/VR9j4/VSBh2SdXcy1ITidrxZI018ZyB
 uIHO6jrtxpgIZ9c7F0EtJhn9Gei3hPXuUHgQiNbpLtn2h1dmzqrga+WigHbl68+p8QhPLjMwa
 jmlY5nDFPqTut0wJrLh7jgvRQWkKxHYPE5vy2bJvSart1ftyx83NpNqqCwQIaSg2Exnq3EpUk
 nPaGf9cUjizJI365BGrW6uxHYVn6UGpo52dxbA3F0WjQl1FDpV+MqX6Oq4M4B4xC58ZKL3Muh
 TYcd5CRJzDfyGz6ZkNI4v3FTwQvda2k+/JJrI5xDGdfiT+2X5Qqhm7WhHzbqrdfCexgwv9p/x
 JcxusEHxpUGxOXU+p0tI52Eeu6/IlwHLf9xyfcXevVqAFJGWHzY4LDWq3yTLAULlHRgmqxRD7
 8BeirCM8/GCDJzLcBjB9qCGKo3m9DqJmkR2jsRC/thCUkcQ1x+w6XxZo57GYUwjUguQNk98xf
 1rxUx8adTIvdVMklGjnT0TcWppx9DDcgu/0e8KoaYm0pBlmQVycsJ8WwKK6l/JDIuu+mYwRdo
 Z+LA6+yCbym+J8WESAuED/JrqnROp8ADRojGoAs4D19b/0h4R4+1DSGwfF1g1/WWQJXpjYYre
 7dHQ1g9p8f/DMffXeNtzekq7Z4U01dp95vCK+w3D9pe1NtoD629lS5CCcA1cWgQwv7L5nLZzy
 9VpsZ9eCMXVsEWyg1+kmsz1bYZ+CXJLjaN/SfuLvGy318kJLdc9/veSLqeKJhaCg0GFZIrlkv
 jBPOV+lzWV0OODMKSoPRlS8u+lGZ1knw8/+NLN+/X1S++si54g6wlEkJDNoSz7DzmxXEBuhrO
 MfcJFsF9bFNKns2fsDG4xLOpLMEcNhHWFwGxa3/roZ1xu9Mf3ng6U1PMel7p812ehcpKaQylQ
 /kw5VVWvU/4/TfsKZBLYa6dgXRAQ7N9LE+j7IiIQT/0rzbX/PiUOTgk5zwEHX23rRmo4inELw
 XkRzI=
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=gz72W7t2;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.19 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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

Hello,

I=E2=80=99m looking into some odd behaviour with regards to memory mapping.=
 One thing I noticed is=20
the iommu translation table for arm64 inmates, which is define in inmates/l=
ib/arm-common/mem.c as

static u64 __attribute__((aligned(4096))) page_directory[4];

The index into this table is calculated in inmates/lib/arm-common/include/a=
sm/sysregs_common.h as

#define PGD_INDEX(addr)	((addr) >> 30)

This is all fine for 32 bit addresses in arm32, but for 64 bit addresses th=
is results in a buffer overflow in map_range(..) - unless I=E2=80=99m overl=
ooking something.

If my understanding is correct the table should have 64 entries for arm64 (=
for a 48 bit virtual address), but this alone does not guarantee valid indi=
ces (https://static.docs.arm.com/100940/0100/armv8_a_address%20translation_=
100940_0100_en.pdf).=20

It seems that this was already addressed elsewhere
(https://github.com/evidence/linux-jailhouse-jetson/commit/d6d452cfb42288c1=
e81027fb93154c9d7b14fcc9), but my understanding is that the table is still =
too small.

Kind regards,

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56296140-3149-4CD5-BF93-0E27EDE38819%40gmx.de.
