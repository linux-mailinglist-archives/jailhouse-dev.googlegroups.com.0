Return-Path: <jailhouse-dev+bncBDDZ5MMAREJRBCOMVOQQMGQE27S4ZKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 1120A6D4A02
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Apr 2023 16:43:23 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id l18-20020a05600c1d1200b003ef7b61e2fdsf8805625wms.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Apr 2023 07:43:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1680533002; cv=pass;
        d=google.com; s=arc-20160816;
        b=leuAreLsR9K7p9t7MmQZBCGYQUA/7XanQFZVdHYtBitoyzpHKRWSfe+LwP6eaD8uoJ
         groRFzl7sNwJ8OebbQf+/iEiUDECFi+dFB1fk9V64PDQ+VcKEG6eTRNILxp8U1GH3XK3
         9B+FT6o5VTtHKOUekMtOOkkzFzc+ojxHbQ+SjBqEu1gEysLpxkIdZnefnjkWvTiPP1IL
         8b06uqFW7cxl3rHFtYsvQsXnM0H+IvEps8RRpCYDQMEDuvNrCfyaQU00Nf/RPDK64yNy
         P7kZ0hrx//6lB+LXFoovEqS0s8NeoFgG7Ajo5gecbo34LUFWX4ZwlcCX+nQUzLJX6T0P
         4gOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:cc:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=RUIMdAdWdCzEVietcpqyBWHqxLQ68gsBdAQWgKrkeC0=;
        b=b2I2YzHcMjPLB01eYFVlp+59GRsiQVj7SlxnPoNObBpWyB+l2YfUZRrXnb1kvsHWtD
         KIC2w7uwJCoMappxbIZiJW8I6gYy/kffLKWNcAGFEN7y2P//ZqGl6HkUK8auoBEQiMxj
         Eh6IjwBF4Agp3KOOU71+GhVyRZRSRR+TwwJpm+mIDuqarzfh6YiOyETj4233CIUNBBya
         8wPnZx0U0LRKFZpjpUxeivi4cDuI0dyF99BHwCZQ/yXlkEkCw0jJ2qn+Bkc5Z2KQKFFs
         WI4QbqPeJcdk4EnQNlFOI5F4K6gKVGjShzoZI1xwcO9wiRQRoiaONUVAK1zbDHF1oRx5
         el9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=csJKsPzD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1680533002;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:cc:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RUIMdAdWdCzEVietcpqyBWHqxLQ68gsBdAQWgKrkeC0=;
        b=Nko5z5ntI8WpyhWRGxP8hr+1Rutzv1giFsbTddAJ1vxM6pZIb7JX7t6nJKZP7nSH2l
         QYSrwUlOCPYe8BEP2aCktT1J7Jmu5ck/gTMzPXfXSALzmskrVnQfxaEcN7BYE4STCMgS
         6HU19OraCQTYmJOsaNTkcU3G0ay+f/J0JixwWE3350q6pMKJv5yTlnZp0z8mHEkc5L/k
         EcAFbAN0otZsU/PEPIT4k97YRbtWS9npCgkXUKZVqSfEU4+ptrhlaH4E2fdibFB0QnPw
         QLfzlSr227DjEg3w2WB8lu7JVLJAQLrli/6kcROXItwY8y7xPt2yc7ZM3ANEJmmuaz7W
         /2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680533002;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUIMdAdWdCzEVietcpqyBWHqxLQ68gsBdAQWgKrkeC0=;
        b=sQLSHwi07+SpQAn1wEsnsJQei0hlva4uFlfiExU8rGO+yvGI/egFAAKCSBCsQKFAKf
         PjJWIu8k+Ik7Yynh7irXoQRUFNUVYnhSiqyOZHjJ3KHI/PoOj5jMnOnQvh7wnf16gvmo
         dr427tkrI7Psje/PSQTQlsg/xqsGNji/c0hP+fapJVjUNxwyKvENka+K65yag3LoKZ5/
         fa/WQ4pMchtIAkJSk0XxBV7b9sgy8yt/ycTcWhKgWcV93ScmzGry7PxQUYHhC+yM/LbI
         Kw4BepidpudbS9FPhNrpK4x4joLNOpJwm9rRDt62d06VPJ8Y+hDhyy0BRtIggoFUMhZQ
         w2kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9fAkA8i+tmgZbrlcIlcLzzGaDFsg1dciSEQLiRg1Ut+Pqosz3NU
	qySU2Yu/9fAT2oK6KGNbON0=
X-Google-Smtp-Source: AKy350Y/O/Boha5cFWyQDOa1yXtbLv7B5NbOZUDLdiyXStgfANuC81Fj0LgAfNJ+NyivC7lBi44gWw==
X-Received: by 2002:adf:e98d:0:b0:2c5:7eb5:97a6 with SMTP id h13-20020adfe98d000000b002c57eb597a6mr7745072wrm.12.1680533002416;
        Mon, 03 Apr 2023 07:43:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:358f:b0:3ef:df3:1695 with SMTP id
 p15-20020a05600c358f00b003ef0df31695ls7741280wmq.1.-pod-canary-gmail; Mon, 03
 Apr 2023 07:43:20 -0700 (PDT)
X-Received: by 2002:a05:600c:c6:b0:3ef:df3:1693 with SMTP id u6-20020a05600c00c600b003ef0df31693mr27112011wmm.32.1680533000683;
        Mon, 03 Apr 2023 07:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680533000; cv=none;
        d=google.com; s=arc-20160816;
        b=Dswet+TEntJ9kRrimVlRvC6gzRMhYSMPBRptylCnhmGb+0gUQ5ysRmv+yFMTiLTcfn
         xfOjJza1Osz8wsHqq3g1nHrT48wc4xlNUiBvr+xv4es9WDaLuJ5HHUTXUIxkyVnl5iKT
         VRSbbdS4Xm4Dvp7yOoSX5vDtWGo7LxLn/0XY2vbw6AEH/UiNFiFqrdMNMxdEyCY2fggF
         vNVilFz9pwrxeoMPEwnYi6M+A6pYyUs/D3zBbcvqgQ6Z/MZo5zZhR2U7MZU8l4staAL2
         VRgPREqhHqKakCluRGzqSt9B8ouhCtRZUtuvez4jRrj3PWwThIrr/fEfn9UxlWXHw/bQ
         HJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AEKfssxvbhvx8dLHFRifsnOUloFX4XkTtD9+95TByaY=;
        b=LM9Ti2MbDxzONTXlrSQjPH9nXREAoFYCflFLJOX7wUNT2IH+mVKPOa3J+vFay1RZYa
         8QXtMZEQnt9LEjgNwq513/oPpCuhFPW8U093FpSfXiqWSccxg5+j6drfDBXtponT6Tfe
         OyMMt5WwSXLU4hPAlwkIMPyFkGfaeo/Fpr/OsgSVMmDehcQp/pGn830+6E4wi3k3TgBv
         L2d22GuDnSw9SLzOPBebUzIQJUj0AQqjBn0qpUa6alFZVXc7GfdN7ChWA/1MQOBQMnsi
         pDuBGZ5WH4u22jPg92AC1AvAnbrewfCzr5WzI/xHYLmj99QbfuMnvWEgo1juaOuhPUOj
         b9Zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=csJKsPzD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id p30-20020a05600c1d9e00b003ede00b425fsi1100217wms.1.2023.04.03.07.43.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 07:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4PqttJ32HLzySS;
	Mon,  3 Apr 2023 16:43:20 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -4.217
X-Spam-Level: 
X-Spam-Status: No, score=-4.217 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_MIME_VERSION=0.001,
	LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001,
	LRZ_SUBJ_FW_RE=0.001, LRZ_UA_MOZ=0.001, LRZ_URL_HTTP_SINGLE=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-1.349]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id ks5SWKgyw8Bc; Mon,  3 Apr 2023 16:43:19 +0200 (CEST)
Received: from [IPV6:2001:4ca0:0:f293:e18f:187e:4664:173] (unknown [IPv6:2001:4ca0:0:f293:e18f:187e:4664:173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4PqttH16kzzyTR;
	Mon,  3 Apr 2023 16:43:19 +0200 (CEST)
Message-ID: <df4f654b-fcc7-bef7-d385-0841c16e80c5@tum.de>
Date: Mon, 3 Apr 2023 16:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Performance issues on Arm64
Content-Language: en-US
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, jailhouse-dev@googlegroups.com
References: <8EB33626-D440-43B2-91AF-D1C06BD34770@gmx.de>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Cc: Alex Zuepke <alex.zuepke@tum.de>
In-Reply-To: <8EB33626-D440-43B2-91AF-D1C06BD34770@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=tu-postout21 header.b=csJKsPzD;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi Oliver,

On 03/04/2023 14:46, Oliver Schwartz wrote:
> Dear all,
>=20
> I=E2=80=99ve been hunting down some performance issues I had in jailhouse=
 inmates cells on Arm64 lately. The problem was that some operations driven=
 by interrupts in a baremetal inmate cell failed to meet the timing require=
ments depending on activity in the root cell.
>=20
> I=E2=80=99ve finally figured out that the reason is the page table operat=
ions in the Linux root cell. In arch/arm64/include/asm/tlbflush.h in the li=
nux kernel all page table invalidations are broadcasted to all other CPU co=
res. As far as I understand, this forces all CPU cores to flush and reload =
their pagetables, regardless of whether they are running in the same cell o=
r not. In my case, this has caused interrupt latencies to increase from und=
er 1 =C2=B5s to above 20 =C2=B5s in the inmate if a Linux application did s=
ome heavy memory (de-)allocation.
>=20
> Apparently this has been addressed on LKML before, but the proposed patch=
 was rejected: https://lore.kernel.org/linux-arm-kernel/20191101172851.GC39=
83@willie-the-truck/T/
>=20
> Since I only use a single core for Linux I can workaround this issue with=
 local updates to the page table. However, I was wondering if there is a wa=
y to address this in the hypervisor?

A hypervisor-only solution is possible, but suboptimal if you're not on ARM=
v8.2+=20
boards.

You could set HCR_EL2.TTLB to trap TLB maintenance instructions, but this w=
ill=20
trap _all_ TLB maintenance instructions (so, possibly quite a lot). With=20
FEAT_EVT, you could use HCR_EL2.TTLBIS (TTLBOS) to trap only inner (outer)=
=20
shareable updates.

We had similar issues with cache invalidations (where you can use a similar=
=20
trick), but since we didn't have a v8.2 board, we needed to implement a pat=
ch=20
for the OS.

Best regards,
Andrea

--=20
Technische Universit=C3=A4t M=C3=BCnchen
Lehrstuhl f=C3=BCr Cyber-Physical Systems in Production Engineering

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/df4f654b-fcc7-bef7-d385-0841c16e80c5%40tum.de.
