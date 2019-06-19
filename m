Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYOVVLUAKGQEKKMLWOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0924C328
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 23:36:34 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id e8sf241234wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 14:36:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560980194; cv=pass;
        d=google.com; s=arc-20160816;
        b=HX+/CnZRtD5x+ne7K9FRbuydoMIpCHq7UjRNgvTa4Zvr02eMAQK0i4yrGg3mXBytQA
         HHKtN/+NVHKSgT8WTUnbwPkGk+/LNoBTbWp4FM2AJ8gpaTEzbrGLDoz4nWTij5ds/0RA
         S8zi1LmQCdCDJ2/hGlIj0sqMBGpkZcK/Mc5JVz6OoQnqx8AfeCbII6Jh6AZ7ceGNqG8J
         OrMFx2Kl0L0dLbLCZWoMtQwwv0Zau4DFPTtiYrKTHfRd3Ayz5cHskxhbBpr+1aRarHfs
         ilXtOMNUevcns6YHoN6NhHeRZ5pN+WvDc4Cvw7TrWq+r2M9W3Y0ojhPDoRkL18Q+NloM
         NhvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=8b6qQ96Y2ZVCgrVMU3SnEsSzRUd3ajNaxdaT+QALF3w=;
        b=svm1LI5Lt6ckK3fS+HZyI8+usOW9s3S7B95t0KavVtWvOMiiNF7nnYpHQvCMrHTtp1
         glkPEzy9XL03ufX7Y8MT3dXpb3d6a5yZi2IQX13Klz/gvuKJ1nDJOFsCp5v6PAFc33kq
         A55pgbiZ1HhKKKEBpw+OKxzjzh9Vm30HBcTUkiAnIlY2rmW9yOC3qL9o7l4ds61igTiM
         kef5nNpqJwiIa++CCeIzcOtm8e586M6UhCF4vb579Unmr6eqpRXD0Uw9Ffa7OwxFsGJy
         NCyFA4vJD7uc1H/5ErPmmMS7eOUhKcnoljXCC2up+5vKtwAjP/SlxKRO8Ofjbv+2nx+N
         QpxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sbmT0y2+;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8b6qQ96Y2ZVCgrVMU3SnEsSzRUd3ajNaxdaT+QALF3w=;
        b=YGPLhqjAdn73zHp0HhrJC3hXBLTiA4IDCgaN9vuXnz307yfL/arvGFVev5tseKrC5j
         i7pH8/r/ZEtXD3MHQWmyJSCUJG2KgKgIfg86VV2won14o1RqsJnF0+YfbEGj1eONwvqs
         db7ajlkCKpqL/kftIpjaBOIivhHNwVWTNXdiGH2asRpYKNm+U7K3SdWH4nv5rRuQTbMj
         GCGBao6xybt4lVPDnC2D/HpbPIM06xGoSlw9mhrWhNFMLmJ5wX/gtjM+Zyh8MwwtGahp
         t8jTdIn0Ny+TUp4KBOg7wkYaCQg8Gpk/sjtPRrJTygyksNUQFnZDI7WyALTdODT5ArSt
         BohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8b6qQ96Y2ZVCgrVMU3SnEsSzRUd3ajNaxdaT+QALF3w=;
        b=H1GUL4ZJGQ79rtfvnefSBGEuIg4MjkhlrG4rG2GMdFObRRC5cM2vq4udIhGq7Bg/xw
         PsfjzGv/CPpW94YYI9p2RBhaLQhpsjMsEdtLpS0+OMEaNCxZEOZUcbIghCc2W6urN8Mu
         lFF9/mi368fDVbS9gowmILcIUloJyMmW6TRkstLa4ybbtUziKclSpySiJZ4Qz39+vEb6
         6kZtUzYX9jubZXT0vocqkYCu5czWGjf9rPqmg7O8ggrAUJMC/zMkDhy2RUj0ZJckoS0L
         sBfCypUuqYTUmnYr0uVY/3UiAk42NYChlLiC5HCDgBp9zU1ZbWQI7XaNQ94IAFNYCde8
         MU8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKxKKzEr6SGlAmQ9536xCtcygVuhIa6DXCQqd0HfT2NJyLBJiE
	qLuXBu2nmiSV2CsP501vbmM=
X-Google-Smtp-Source: APXvYqxvkN77SNmud2MV9alzgoRaf0N9f0iW8BIvOoqGyHMyAnL15DpmKz3SDeoSibreVFsWRuywhg==
X-Received: by 2002:a05:600c:1008:: with SMTP id c8mr10150054wmc.133.1560980194068;
        Wed, 19 Jun 2019 14:36:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls867917wru.0.gmail; Wed, 19 Jun
 2019 14:36:33 -0700 (PDT)
X-Received: by 2002:adf:dd03:: with SMTP id a3mr35069190wrm.87.1560980193480;
        Wed, 19 Jun 2019 14:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560980193; cv=none;
        d=google.com; s=arc-20160816;
        b=cSEnSo/dD27wf8QaAz3IeXRtQE++xQeLwtVvjP8PPohvXKSwCSLNHiQiC8/f2zkyfh
         miMoNaaIhMzEDhLm6m/tX5CwNUq9dvqDhgT01dwy4QtKKNiEKf+YLHU+GJ1rGGmH5x1u
         0oX4ZLP+NCxzDQFieTCFv72V75mNAQI89KAv2vcSZ8dwzLmuQR7CyzZlUTgSEySSM75D
         xxS4l0P+R8QBNd4lb/lZ3Dp2V33CfVr3mksrIfJ1zIIMVU9aKLoJ+/MgttX4uKRTn3Et
         OFicfucXQW3b1TxnHyUcNhkZu21+Rekd+wvT5VCehbo5zdkfFSbIFcVIUhNJ78DkEekC
         chZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=sSzxbQL9VO/kPl6im/G8xt1LZgY/mMET+LVlxhf924c=;
        b=jGwPTgafVpY2xQ7NcKHkLdQMOQAloc9+SyN5/D7XpSWTdReDGMAxHIdckW960hfoxI
         me08YxHASeoAAniCoO7kfniVKq9xjxZyftnSCkG7ypmqlv3ASYJbA5C3MTQ95xPf27I3
         yv53nHqLlaVkgJQ1i2OQW4Juth7e65pKoTKuhr9jpBD4UblhAWW+FbzmrOdMyJmZB9P7
         Jz7B69rIlysgCcxzps4Nna/GwbP26S2C+bQ0TZBnARc4hPO0TYiqbJlt97bVI0GHAb07
         ruhMTp8F1ZzepNzB2QrQiS95Yr5lv+48pai/IEyCVU8O117CGKJAZjiVyCV/pM9Lv9iN
         U3/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sbmT0y2+;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id v21si496513wmc.1.2019.06.19.14.36.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 14:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MGiLB-1hrAeH0buD-00DX8Y; Wed, 19
 Jun 2019 23:36:32 +0200
Subject: Re: jailhouse hangs after enabling
To: Carlo Caione <carlo.caione@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <1d8841cb-24a8-f75c-9157-d03776cea4af@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c5cca861-c26b-21c0-b651-e5b4d870439e@web.de>
Date: Wed, 19 Jun 2019 23:36:31 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1d8841cb-24a8-f75c-9157-d03776cea4af@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:5qQ8xzjoV2vPvyX0tU1AI1c0fDM08MW9LhYlXttH2SejsrBPj7F
 L87nM7N0QbWU6wRw0XDBlCyDjVwlAST3n0FeRn3gKG426UFGEiFvOqYvEr4PHEurXLVPkxv
 f2rMlpaA+w53wj63PwMe4WfIv4o2h5pLIip6x00gqOs+t0rW5BOny5cVmlbMpveEYxErmXA
 KnvJIHbQ1teWIi9BRRDdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J+230PiGeMc=:FBhcFx/pNMiLVWchyfQH0y
 tQgYtYJcF26dw3tzZGgU7sOtvH1p3tLfscuJPb0Gu1o9Z7tcWrJmjv2CockgC0jeBM5QqNqHh
 80BOuuUeUQxF+YceCS2wnms/sTio0YrxtpXPVDlZscbrjouH4aslgx/UFumGRCLp/xzPElOL0
 LxLYUO2GMTz5S1rzkcgtaDkHz25ZyUzgvk08p+/1pxqaF0ieHh85ZV0NhUtxrcMN4F4OsXqIz
 SyhihWvlys2w3BN/rlllai/YJgwdACNP+mGNG8czXvCp85g8mbG+WdPv2hmALHp3FrqjBpGS8
 zXM4d8ECX4scbeRtbbC99pSTHJUIr2f8LwjUN+Af7kGcBPSDU/VxsveXJQKg9kZnwCPrz4QK/
 FW1w+IbEyaxrCGxlL0fy0mebnueSj8aJKw5VqDM7aZC1kbflpJBXzol25r7AkHGlmGscK9dvP
 KuhPpKx4AJ3noM9gQfxBWxfj55vTkezJd0OrNyyH1klsB1IdKy9txh6rgToqN8TQ8hclFCiXp
 qElP/l8pgCtS8zI0gyT1EwNWSP4k3kniW/Z5XgT4c2OMEEJTt5SqRRwO56ythGiGmOdiIZmPN
 ExjCyOGYDy238JLZqKLWNZ9hF8M1PZX0/IzP2dv9UMTdvY6Kvkn93dFGMljdpcKZWKxfTfwk5
 k6x9fQVKqUkwd5Auq5qpCoJfgqg1kVF7hzywhX3LbLGdtp3nUGWnyH+S8WniggAittXXQf7JK
 JfbCUlYcgWYyA/RI511ZoBPTrWBK2tW/rA86XoCmauAzmtVp5t46fGcULB4+iaKxfTXcY67BX
 KqRHJdgq0KA6Eg+D8TKqVNOZDFcNesSmU0+X2yW8GKFetQ4bkLzAOsX6etJNDkQckgQ/DRSth
 kM67Zy0hkeRCd7HUvkypGPREyQvZOFcONydjza7Fcm9d409+g3MKvyknOG1cz1yXtG21cf+Gc
 7UCaxJl3u/D7ui8yQ+uIxsWBiLus05MgwjsQgUGm+7dNfUMO0GPZm
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sbmT0y2+;       spf=pass
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

On 19.06.19 22:58, Carlo Caione wrote:
> Hi,
> I pretty much a noob with jailhouse so hopefully this is not a stupid problem :)
>
> The problem is that my whole system hangs immediately after enabling jailhouse.
>
> Some more info:
> - hardware check is fine (at [0])
> - jailhouse is master, same for the next branch
> - root configuration at [1]
> - cmdline has intel_iommu=off memmap=0x5200000$0x296000000
> - kernel is 5.0.0, same with 5.2.0-rc5
> - kernel configuration is the default shipped by ubuntu in [2]

That config will likely enable more features than Jailhouse permits.
CONFIG_X86_CPU_RESCTRL is one example on recent hardware.

> - the kernel conf shipped by jailhouse-images (amd64_defconfig_4.19) makes my
> system non-bootable (yes, I should probably try to fix this)
>
> The issue:
> - after issuing 'jailhouse enable configs/x86/sysconfig.cell' my system just
> hangs. Before hanging, in the log I can see the message that jailhouse has been
> successfully enabled, then just death.
>
> Any hint or anything obvious I'm missing (i.e. some kernel config, ...)?
>

Before digging into config details: Do you have the log from the serial port
where Jailhouse writes its messages on?

Jan

> Thank you,
>
> [0] https://termbin.com/xaoc
> [1] https://termbin.com/ntp8
> [2] https://termbin.com/t8dr
>
> --
> Carlo Caione
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c5cca861-c26b-21c0-b651-e5b4d870439e%40web.de.
For more options, visit https://groups.google.com/d/optout.
