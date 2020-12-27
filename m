Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBU6LUH7QKGQE3K322FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFBE2E30B6
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Dec 2020 11:45:40 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id u17sf2151677edi.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Dec 2020 02:45:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609065940; cv=pass;
        d=google.com; s=arc-20160816;
        b=UJj87V3ui/7PUeLZY5gc9GwRauFoqsMSsL5gxt6PC/ryQi69KGAZaZcaUBKQfsx45q
         MeMXZFZkP5jcGnBweRsWooRAPOFzczCekTp3i5ozL4zLnHRI1CrRWTvDYqXDZ+v1cylP
         eZpiiKRD5msYobFG7Tw95EdxBNexZRLokl9a/Z7difgNh7lgQhZ/H/5BE6Xy2OYPX5WB
         28hj3vImaU8aHxYVCmD9jFR2BZN/AkMsNi3byS0GORUSiqxHSAYqgR9WETQZ9a0Uzkx5
         PKtrAXyJeMIQpJIbMvetBwmHpLhSCfVmiZmVP5rpvUp708GY0FgtwBchaqF2Q1qssN42
         p2gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=jzG93nt4wJXxi5acGmJXobDyD5tkA3LChdAsgKgcQSQ=;
        b=hxEIMr71FYs0NuZY8JWXZ/OZ4fe3dephFI+ln2SGZIMCUc1Jdv5ts3KDySNEpKQaz8
         npcH2/JAhz2ofPBhzXMB1YXJMohSj8hSEEV4ZEEz1FWvLeM4k18B9/KuBuN8sjgU7L1f
         Ke2j4tH9BwZDVhbchRiBKzcMjH76kVoEDqv5OP3MGppEux1ihQd0ioEMGWo0omfrgv8/
         GYiIymfTomCNdxwe+nLErb3TSJtiaxkhJ97Qy1oho1eAuGqQNXYtex2h3TvL9ZI8pG/x
         xWgmKHYCIRYmdPSHD4vpYyeelLdZrf3nFfIMqXD7FhE+8zAF6diGlx48wQ/1gozFgxRb
         eAsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qQRR7YGB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jzG93nt4wJXxi5acGmJXobDyD5tkA3LChdAsgKgcQSQ=;
        b=hZc4N2WZQL2AoqYuy8aN6UBx7zmVftuazZw8vDshvQPHwpeELHePy5q4wV69x2o5EP
         SG9xsFD2Pmh/o4Fzb/vXXaMu7bZw3ov+C/fnSbJ1BkaeT1CDvY7Km8fIQEzbS/35l9gX
         4a0f7gidketsdHbd9jq3ntvdiAflWLexH8Y1wAvfKLdyp+kdKfqEyT0e7dNsBsE0mAoo
         n5RonYk5RDJyT6GQlsBwpHcKmRzHOAXqTX8PpKjS910Hu+BiD1bozm03j2qBF7gMGLVr
         hmzLCVFR6CTmr1ajSh3KeeLx446RWqKwPOQ9jZDaVkEGi6t8/vypDfqLEnUno+MsZKnX
         BvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jzG93nt4wJXxi5acGmJXobDyD5tkA3LChdAsgKgcQSQ=;
        b=nX84TgsoqAfjeRuZbjnlOdTFSsiojibPa/1BaehukxN6zgNzKyHbPMrhNjVCI//vEE
         6kYKEFvKkQHWBBEF9IfvijrctSe7mTBLbHNtaxl5xz+cec4SbcHb47FheDOc/gDFYr7P
         aG9fKfIIAuzue9gwIcbv8ye1HzMIlS6cfJyDMoUiFQWiAdD0o74eR7PjLXataoHGTNmx
         zFv/bjLacmpCS4xX/cBn4gw+OXopJMVY7rTQLynQhbr9Y0gM03Inp3h//Rt5VuKehPNk
         OW7y1FZ4duWHSP/WMCLBivb3syKg001VhmD7IqQZALRYyDQ9kac3pLKy3Gy87gc5kEwr
         MxQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WWu/oezWYk8nwnjAHdn9emH2AMEf9QKxE1aBhkIYUTPlUQUTa
	lgQuxZBZ4uf/TssqQSqVZPE=
X-Google-Smtp-Source: ABdhPJwNrh7LOadCsQqFiA6dgfklLgm8Lf5OQgrf/lBiOmNiRCcZC6ztRnrxmHqYayzqczo6sE5ZWw==
X-Received: by 2002:a17:906:77dc:: with SMTP id m28mr37261375ejn.64.1609065940126;
        Sun, 27 Dec 2020 02:45:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d115:: with SMTP id b21ls1794075ejz.11.gmail; Sun,
 27 Dec 2020 02:45:39 -0800 (PST)
X-Received: by 2002:a17:907:d0d:: with SMTP id gn13mr38366355ejc.390.1609065939123;
        Sun, 27 Dec 2020 02:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609065939; cv=none;
        d=google.com; s=arc-20160816;
        b=fSC+WxA9RbyGd6q6Md1QRUAnbBnfYAhiQOE/GWPqDLoHMbNLNeBNrjFYgYYsGzyZSL
         sRtvEQAJA8OqvAxQYVkk8DTHQVvE42mlyZ09nJGADSqamccZKIGuTIvu5N0d1OZNkZ4R
         4TwobEqZv3NsAxttkMErNZX70z5wdx/QwVDodTQyvT695IpjWRPAp29d+BJcMtwm34yY
         lN6xmSLiEQz6zZYG8e+qsN4wmVCsK+BckJsz4VkJMZoKlwcvfXptfeVhbIKmKBMyY31d
         pMsTYxYsH9LgHUq12cL3+LEn3wpBAUbnITMd1M/ARdqL3zkqQ3YjbCyTHC/fTGl1WEZr
         BQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fWmm2h607DiArkPCVaBfk6EdO6OZFwZbbqQ68cGd04Y=;
        b=doDNzoET02+c1ABRBDKAZ6WZXsX1xZTwegyGxVBjWg2whoOYj++ozw9usDU0HGOhzl
         hkQ++Tfyg+WzNHo+Q9s9xJ6Oz9Yq3JRpZOlhnMZA6hUU83jEgjATmTkmZxkylQ+CZz5D
         XZ22zChy9pVbBuyzEby0cqeiZO3NEpRIT3VxQr30S/MIWbC0lvMbuYUrINHStd/llTDq
         1dglaNwZxDbC0iwPpcnDxmvSte/Xp+sIy7qLd7FaTuJFX12jGe7Sk2szTLZFiAUbJIf8
         g8k+LZCYK5QednDt5bgkHKB8oEvJqHoiPiZMOSCK2xm9yMBQz38M6LUKqYcV1gOha0Z1
         DAjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qQRR7YGB;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id i3si1220439edy.3.2020.12.27.02.45.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 02:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([92.210.5.54]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MaJvw-1kZcHy2K4G-00JsaA; Sun, 27
 Dec 2020 11:45:38 +0100
Subject: Re: [PATCH v3 0/2] Jailhouse: Add configure files and dts for NXP
 ls1043a RDB platform
To: hongbo.wang@nxp.com, jailhouse-dev@googlegroups.com, mingkai.hu@nxp.com,
 xiaobo.xie@nxp.com, jiafei.pan@nxp.com
References: <20201222075127.3777-1-hongbo.wang@nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <fc8a4ee0-4909-9c6a-814c-1e217a0bd54d@web.de>
Date: Sun, 27 Dec 2020 11:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222075127.3777-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:yl/ezPpwfK7o9vIcMASTzO3y5CNe8q/hiB3j4Zt4Onivx00k25f
 NXNgDIbDD8rY+mFUIuuZ5IVOq1OYTMDwjlUxPAZh9smiquUlS0zCLK0srD6zPNiDHEEoW4k
 Fjddyvtv6c/LU/hr3eOH+E57WHv8OlO+VGc3rgMfl76bf/Z6aP84vodxfoHTXZoXA9VWzz9
 NoYpY/Q8sZaj1uzCibqMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oGtLMoIeLZg=:VV2Rd+ZezGbUQ78EukUKmo
 gny4yHmdNItkfJpbNie190QxkhYF2EDx7jwBqgAWJp333AZwDv0yBdENeADoty8TzKA2wlIgf
 MGzeZnbDCUJljEatcZ1aT6jhfHSccmH4ZlaxgwEdrXjCiafhjJIPyXR4AWvZicTBEXa/KOO+r
 tCB7Z2eSr3e161gWOYzX2vYvysuBh2McT8yUIZSXEJC1kXj99GU/C4BQ7+Rc2M+ST79FJg2wd
 8ddJ4BF+txx1nNFDARhc2iRDboFMBqip0NNxmaDuyzN3ztyih2xI0j4nS06nMgTndM8IJN6xj
 VC5AFoGbjuUZSsWAWkw36IQl0DGg0xZgiRf2CaanQR2YeuU45lPtZv6pSBHR1qpfrX26ws/lU
 PQeY/hWOHWBiT5Q/5LvGCvPqC9ePMw/jrTgDwoTmMkumemopDxEovJpC/nncUeP3/rGwbHbk0
 r94MpaXnxFablM7PRJ8He20Ky/lorTnycps5n/dp1Y7CT5iuFJt4oqjV5MGTNujEXfGOYP3rS
 NE11zFOH7zO//XN4v6hglY6SOZzCJKiBiY+jNCC//CL25iwtHu/GJ4xRGdyhUYDPGED62fLva
 iv5IPFow6ICjpCiDCiBLz+r2BGjFAJS9+g0dMTtA9SFcLs2XkKHSgmie2u6r1zVBxjvDYqc7v
 lU4MIp66++PHjm1zZZAFBwr5WDVKvzIAFPmMuAdA2wMm7VQb17/ryGDpGCqMA+QzZnZd41c7Q
 MBfdwKXQxwr2nBbNWsz8uLCww1uwU08eQc+5aQktY7Hq5A9u+I8fFdJTkX1XAEI4WMT3H5EAg
 wxgrJ71FgmBRLbBtHlMupCwNthUvgMq9lYjmtNSvQ7953UhIgkieIIQNFr5hIJDrQGkLcN0AV
 eV4l3zQBdaVuiWT+hp5g==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qQRR7YGB;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

On 22.12.20 08:51, hongbo.wang@nxp.com wrote:
> From: "hongbo.wang" <hongbo.wang@nxp.com>
>
>
> v3: change memory layout, Add uart divider in ls1043a-rdb-inmate-demo.c
> v2: Modify configure according to ls1043a-rdb Rev1.1
> v1: Configure is for ls1043a-rdb Rev1.0
>
> hongbo.wang (2):
>   configs: ls1043a-rdb: add cell configure files
>   configs: ls1043a-rdb: Add linux inmate dts demo
>
>  configs/arm64/dts/inmate-ls1043a-rdb.dts | 175 ++++++++
>  configs/arm64/ls1043a-rdb-inmate-demo.c  | 138 +++++++
>  configs/arm64/ls1043a-rdb-linux-demo.c   | 165 ++++++++
>  configs/arm64/ls1043a-rdb.c              | 496 +++++++++++++++++++++++
>  4 files changed, 974 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
>  create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls1043a-rdb.c
>

Thanks, applied to next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fc8a4ee0-4909-9c6a-814c-1e217a0bd54d%40web.de.
