Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBCWZ46RQMGQEINBPQEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC0720316
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 15:20:12 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 2adb3069b0e04-4f51ad7e703sf163176e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 06:20:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685712012; cv=pass;
        d=google.com; s=arc-20160816;
        b=E0+cfH56oi9AWsXAovYTKr1AnI+6DY/YDVrlD/Q7IptzL3Y1wrAVk+F9Pf6f3I7UQC
         cUJl/uP9BJi4tWu9/VZQ6PXgw4JxTCE+Y+pHauSnv067uy816ZnOoKuw6hi8tR0lDU6Y
         Mx7LvujeB0hkS+ZIYrrjPErpUyatkpNIoCzyHa9RSrVlNR2OU6kbi358roeLjAFQwdl/
         j5RYvyKBUKO4l2kyCJ3pTdxtFvKSb8k25Lr5j/VD5uB/SY2Xw+eu6dVT105Jiqd+TGD2
         0wkcy2sIOPHKdA7RQhbJTlPDlB0s5T4Z1dludBB/fBa7fwxYxRQF2RmjSYjCm9CNPB8e
         l9Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:ui-outboundreport:to:references
         :message-id:cc:date:in-reply-to:from:subject:mime-version:sender
         :dkim-signature;
        bh=vLf5gvty8aVfmVzp2S1DWi7II+xm9y3vBs/AAHs/QcA=;
        b=fVsZ5Bz+Qy0K/lDJCnJGTawb0lw2z2/aFKZHa1HycksBJXPRSQf0u5RXXP2AaCyFPy
         K26iv6D641itI9FhiiqJvL694nZJrit50OpsEkfWUpz07WmzBTZjVGS/2sDCNulYjihM
         Chjr+fsx7CM61Ugo8Phg1iGCC9qnOEFZZuGDYBSU3Mm4Uvhwd6DRXR5GY2ItMFHpK2uP
         B5XsG8BonmPhbtC6dCX+JyqBuILctRU6aGBSJULWDwDb/6aa++KYNSVHfPnGIEKaeBtl
         dfG77IJRwjo10uaNxKA9fK08o1CvAyzV8o/X/g6fboAGW1DoswoVRb2ikFew9uaJgUKV
         uFcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=JZY4n11h;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685712012; x=1688304012;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:ui-outboundreport:to:references:message-id:cc
         :date:in-reply-to:from:subject:mime-version:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLf5gvty8aVfmVzp2S1DWi7II+xm9y3vBs/AAHs/QcA=;
        b=k6yqKTuQE3f7GIafJtBzXwtqNEbk20CT8EAc/e9dhotoIQXOQoX8Q8GVC67FZW8/ch
         AFJ/PXcA8nAGt5TFeQPi2MOTfGPZx13eXyVT4P6+gtL7sVl7wSXzfSVnvTGrsUpqrnzr
         GLhTEeXEZJ18OOfXz8gfoDmCUqZyEkNV+lIvV5C8/F5fF2bmqFHhlvloW6CHTamxxm03
         fIEbfM4IxfmS170f0G1OsnoKSt/VQmWDmbYH0NQunYPEk5VFCuloZ3YLq2lGOK8wawUl
         3xH+UenlvgJl3ny/xsEnUe4FrLYF6Lo1UPMXD1aKx2ueXmK7dd4l6qU5NHoOs4csZtZZ
         GjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712012; x=1688304012;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:to:references:message-id:cc:date:in-reply-to:from
         :subject:mime-version:x-beenthere:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLf5gvty8aVfmVzp2S1DWi7II+xm9y3vBs/AAHs/QcA=;
        b=KX23RVxyb5GOyI6N6PszjwmC0pzsFQsQvFwHD7CDB1BCFyZlsds+QktoSUacTMa0O6
         krlExlPa6JjvG2y4DxdgOc77Lkb7eqK+00mXj9u94iCXfC+Jpzv2l7Jc79I4iTDp2TED
         JDkRDFBsryvzLiIT0WZRKSiSePuHDdd1CDuc5z2mAvuowxNrbVgdbwCahxX8E1VBUGGF
         z9VflMfamDB32B0w9umKj9ERVpd8NPApHr+WWz5iFk23jkENpWyNAO5gGxlwCBKkM+Iz
         parMfVuneT21v1c2LnNo/TJ1LRnw5JZtMvwv+Bdmde5V38a0qAek9QwnZ+2nqQKAf3Tj
         pT3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDy5y9uvAoS+7qOqftJvOuRPr5TTmsxSMi9AlFz47/mNBRgDdzNb
	Zmna5lXKbHB4MNOcjV6/VdQ=
X-Google-Smtp-Source: ACHHUZ43T3mcuzY4yMT1Jt2dmyqzI/SBbGEHO5mqQUj3q38OtItc6yesALF5uWdymjQSMU+X9A3W3w==
X-Received: by 2002:a05:6512:374a:b0:4dd:afec:fdce with SMTP id a10-20020a056512374a00b004ddafecfdcemr3752220lfs.5.1685712011473;
        Fri, 02 Jun 2023 06:20:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4dba:0:b0:4f1:3be1:1d6 with SMTP id h26-20020ac24dba000000b004f13be101d6ls277728lfe.1.-pod-prod-08-eu;
 Fri, 02 Jun 2023 06:20:09 -0700 (PDT)
X-Received: by 2002:a05:6512:210:b0:4f3:5038:5857 with SMTP id a16-20020a056512021000b004f350385857mr1809336lfo.55.1685712009417;
        Fri, 02 Jun 2023 06:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685712009; cv=none;
        d=google.com; s=arc-20160816;
        b=IuRFMKoVMgBnYw44rPL9VyHuSkcfxnV89GGd9LvxCxmDrKUDe+zSqnJYaoiRA0T/NU
         3BhOsorcqmBvsw+wcWQteQ35uw/ESR4LNJaCnjyvCQ8S0HBUipHJnw03i8zJM9uStAGk
         On4KIsCax8upedwXdrZC0XeBh1gsOmGeUklSUIr0bfesOeH3SmwTMu9uUUVOpS/mxPJN
         jbNDwG+yGByutHFmff5YaMUsc8pTXjPDaduQaNBJHKJC0NUy24/II457yUw9Z8FRWUNE
         hl6YvpDuXxItwCZGsYcKa8vUMGIs/dj+IrDiJIFYms+HbhVd57GCL5oUzYaF83hc6CCq
         UpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=fNuIGkjjXbZg0ht/PWTCfzTjNBouNLWKN4GBUmLLA4Y=;
        b=jLL+t8pwIGcLaUVnnQ+WJAYtdHgOR7qtLxtZ5p87beMCTA+B9OOLnoeW+iGGZEZTCU
         4p2g9vV2AVZLzydxCW3NB4PzyD01OHjNTJ9Iv4Tu7IPwnu54ETgabqx6rWf0ZibFl3QB
         m9WcCBKpAsNBO1PejQ9FApRx2BlAFZYt7qzp2npWuRCb3yFFUAEecEFFdOEPQun+7e6m
         BpQIgQLUC9AAw2HMThWpMRSOM7Zh3y22aE2c3BuIcdTbjM68aRsCldxAmJ8vwqV8zZg3
         zXNtFQeQELxjM0SlhYVQupcInACV/FbFpMzrEMNdtPP0Kp+mXQgVhRSGiI/e6TcqeQfx
         ArnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=JZY4n11h;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.15])
        by gmr-mx.google.com with ESMTPS id p16-20020a056512235000b004f4d38a01a4si92219lfu.0.2023.06.02.06.20.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) client-ip=212.227.15.15;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from smtpclient.apple ([5.149.24.57]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1qRjwr2PxN-00o2It; Fri, 02
 Jun 2023 15:20:08 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [RFC PATCH 0/4] arm64: Limit cache invalidate to local CPU.
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <a31396bb7a77423097daa430eb011f6e@kumkeo.de>
Date: Fri, 2 Jun 2023 15:20:07 +0200
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Martin Kaistra <martin.kaistra@linutronix.de>
Message-Id: <E6DEC645-7662-4D3A-A532-86E4023BF913@gmx.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
 <BD7FE16F-42F5-4D5C-9182-2AFC442B43BC@gmx.de>
 <a31396bb7a77423097daa430eb011f6e@kumkeo.de>
To: Ulrich Wulff <ulrich.wulff@kumkeo.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Provags-ID: V03:K1:cIwSRuloklvk48FvXy3ZAgg6mUSwplW2Ye6gr9H5Mb9wV8gaikv
 WZvydFcUiv5I2tWLF+jN2ShET6uEgEQRgsmL4WH+aKLMXaN6brB9I/CWMtHYEwLePqubrpy
 INXqG8nES0cHCrPUQPcfu0l4BFr1t2mMeMHDbaL0T7qD5MuQ3XJrMCA4NzTreneZUwkZMoA
 U1HFyfISLsRVcLKfyzj9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A8daiJLsf0Q=;pjPzUVuc+5QL07sT/gG58BrepG7
 ZbtsXXQZRw67nZe2WdgOmdXxOdwqYqHYnVzabgKu3GmMj+5b0dRFR/ZlZLh7dpQTM8uDXmyO0
 +TyGfQs0Or6mO6FwJZA+AoLFfg1LO5lXSMlPPhKwDVGRyop72SO6fumVkpGN2/xF6p8YOfUdU
 1B0c94loH6+NCHVc9EKuLUL1ApvmaGzx0QVSyEUGKQp5GYfoc2socTYCXCkPbYsfjHn14mvGn
 Yhz0MRZYA8Z8/U8796uRKCCk5EpB3dHGXP95E73EjnsLUuZc4p5QRyxxfqpe+w3M46IBzIgi5
 FBT7c9NpbnEVAm/8xFAY0Ty6U5lKuqGCX0mh+ys1A80qloPgCpCClKDmrCLBWcFGngt5V8Wzh
 GM8nJm3cEh0EtJQCoD4QFfQT7mJpA+y7paA/xeb8dbsxdqbptmYlUx6LEMshmsw++nOiSU2NI
 /uOx1iU6iVFQwbzy860DsQxvW1ZWPhP24KISXK+bXQ0yrSho6UaWHJvS+BXdBn/CPDqOl3M0N
 lrioPEGzlH1wFB1OjkA9MdK3Yp4yHRMOA0QC9BF6lCOzpEvtNeX1AFI0uPr8lC1rcOYAUzWfn
 +PB3mAQyf2Q/IXclVlHWburRL1h+CZ3/eVsC0I+ykQbZxYcj6Rl0cTV59vNyWD05BMozOv6XC
 Q0C6Evh+bFNUdPTr21c4JWTCBqhyBWgc9ESiKXC9aqyoD9SWhF8d7csSDxEeEZeLJqB+riiUk
 6/Vfk8XJMzvjczhp037OFB+/pxmD+cHYOOMDFnTk5TT84A+rmBsLH/mvWgYoQHup2CZuIbRGI
 lWGMi1EZtSo1+aq9q7tpdbvOH+yr3FI3LMxGj7ylrt1X8Bo/6x+/YGcFozA7dpzlkCOXkzOxH
 Q7JQU54tfc+SuqLQH2e9Zgv8GraNrLXSMkflob3znpCfuGUMhlNHHdyDcL4yJcNKarONkkk3V
 khwGrw==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.de header.s=s31663417 header.b=JZY4n11h;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as
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

> They do not address the same problem. I can not see that flush_icache_all is modified, so this will not solve our problem. This patch will only minimize the effect.

True. However, the same mechanism can be applied in the places where flush_icache_all is called to decide whether a cache invalidate broadcast is necessary or not.

Oliver

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/E6DEC645-7662-4D3A-A532-86E4023BF913%40gmx.de.
