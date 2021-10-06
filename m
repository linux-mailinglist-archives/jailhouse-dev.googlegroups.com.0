Return-Path: <jailhouse-dev+bncBDWPRN7PXQLBBLO26WFAMGQE5KFOJGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADB423A95
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Oct 2021 11:32:30 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id h12-20020aa7c5cc000000b003dad185759bsf2085397eds.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Oct 2021 02:32:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633512749; cv=pass;
        d=google.com; s=arc-20160816;
        b=VXs353PgsmBwWqdW975Edg28GKyxljGxzzUBvOEtYxXTMyoJknn7UZsl90xIk64dzm
         lMh9/0qay2pr5nWVs3JDiMMKlKGisMOjSVQuLGuHuGH/L6qKc/Rf13JVeZkWvmBTESOV
         jVNYEehDzMToM+UQ3CqzXEyRZ11fLIPw9kJ75MKqgcuPUDMRfhBydsyGVclYVYF2gJv4
         mivodokA+4KRCblyoST4O3HWh7aiK4sUOlLvHdDpi18N8hIpQuYTr4WUiJN499zQpiHP
         wmqLG2wx3kV/Of7UWCR0qxh1tZp1p5YQ2NU8mesIxhCOP4FghIYQE+UhKJG3aImRCDPc
         Ephg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version:date
         :message-id:subject:from:to:sender:dkim-signature;
        bh=4aWDYuprzBQCuuNr45uAZhDp6Me1LYjVKzl1bxlXqAg=;
        b=vPEc1XGNVW0V+ARrD9aVDx3FsyZ8Iv9UtWtN+jjVPELwsJSFuaEYwWvPGnMoimkCNb
         QzyIMyDNLP3qT1Id+fZptmJ128vADLVfXmVZzCqMr5gLyLPo+S0wIGraVUiF7T08OUyS
         JOUbSA9d6tdmrUp5sRwan6TOLUDX8SOu5eFsAULvBouqE37zdSgX41nBVYvs6aNZ4Fb1
         McsK0tPW4W0nftFozeHV0amXUmjQqktGoRiXWLEQtFe8bSzEAvPc+lj44FKn+1rF4F7I
         +CTdfFOCgLpv+SIXM304poMN/A7tZzrDnAQlkB4C9fHyfZgVFhgPBXiIOL5ghCdzgQk7
         Dubg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=kGWCkxOf;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=mPXczKDz;
       spf=pass (google.com: domain of andreas.messerschmid@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:to:from:subject:message-id:date:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4aWDYuprzBQCuuNr45uAZhDp6Me1LYjVKzl1bxlXqAg=;
        b=mtyBAtv5FpUVV5zJmRsoIhd22rBFGEnSh2g+YpZXgj4IPLHaVNLvntIkYLlghIDCuz
         YkQSMu6Fe5IdbYQTBarOpDSFbVv5tlAUa3TNb2BwL48BBmPskqvc8u93dP2Rl7s0cEFp
         y2BmWVtZgkfOg4gxMafBwUAx9NBKDOexlTe6Fm/2d5wzWbfvVEEOgBwTehY9Y8znef6N
         9kH9LFKkBqA8qi0X6a4XwO+2yrf2ZOFV4rTpGNiMY/Q5PolQ7lpXMlzh9U+ieyXRjFTq
         q/sAyNeePYxyNFLYYRD8ejeI/4Xw+9EXVkdoJDgLRCwrjFrJviQhOwFlz88KO+VHhYhz
         crRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4aWDYuprzBQCuuNr45uAZhDp6Me1LYjVKzl1bxlXqAg=;
        b=iR/qPaFO9f0ARa72kbXKR+tLHNcKA6d6s+yztekBFXvSYdmrX3okpGnYom7dNzauK1
         hjVTmi90UAZVnA57Q6NywDM5iYgnxx0a05tl/pJ3XrCP+f2+KBOeubRx7B8FYk5TeiIT
         d1Pe+YB535uD1KqGpZVlXWbrRwhfruk82JwDviV416FtgUx/4ukqQtYn7MA9VKTblZVr
         ewq821Gy6tg9neNBhRBOzHXGNhK6Um5RkuAszCN617IfrFRPZ0fPq+Hk55yZQ8N4g+aY
         fSMwwgD+8DgXf0lybhVvAVtl8r2Qfc/lIUyIrd/wds8mt0r0mW/YDdQe8iay9ZbS5lhK
         u+OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532UFt96qQdKpYcTZOePMf99nWuVmOz8wrNtvrwl1+YiQihGDV7V
	4PDcfcUkXol7HfHKzwvwtyA=
X-Google-Smtp-Source: ABdhPJwOzGzNiquNPC/oRCghJq0tyaKqg1+VaKaoWuxwBbmiXCkEyvGiNTy1bg53wPYQ9PB/Kp+RKw==
X-Received: by 2002:a05:6402:339:: with SMTP id q25mr14478889edw.222.1633512749817;
        Wed, 06 Oct 2021 02:32:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c258:: with SMTP id bl24ls11515836ejb.6.gmail; Wed,
 06 Oct 2021 02:32:28 -0700 (PDT)
X-Received: by 2002:a17:906:2a44:: with SMTP id k4mr31242164eje.328.1633512748923;
        Wed, 06 Oct 2021 02:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633512748; cv=none;
        d=google.com; s=arc-20160816;
        b=mtkvl/myeQOHY+0L8le4hRQJd9t9K6B+XqnD4VnHZCKgb1PmU9x58AbZiTn6R3ASN1
         g8q4B/DpTjjF7F9PSEo1Mu2C8LH2g1QnZuhDG90Zf2P1ySYTp2epMzqENo/JwCp2zRd5
         5D3LnMTleHerLBnOsvHb2Lr8yWcZb1vyDEZsLuUI9BMdV7rUHEcNvFP0NrbGKKkWQkxF
         fcg7ykCItXHF73IYL8MlWycBuLhBGmp3ub7/rGNSQbHsk34eeFru2XKFKeq2Q0YKaGuE
         R0PPNI12SJ4VgzvXeB9A/XGpYMpj+fKU8A7KuZRjAOWBLuWbO9C168uYi5Bv2GyTgTB+
         MyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:date
         :message-id:subject:from:dkim-signature:dkim-signature:to;
        bh=m+rGckHdKd2GQzx7fH854aU5RN2QNqCTJ1pLbPxCVm4=;
        b=1H3q/MnnZmOv2kUPwJ6cvKs5XWZ1BS4uLy4gl88E0FEmBdVJTeXuchSja4YIglcUbZ
         1UBbNEUGyxP5ZFQnBPIr4j7Fc2b0FJznbh8JimMMH7IXaMdn8XgnC1YRbT8xLmnNkKwM
         +8S8AXh5sSiM2q0NbNUrgt0DeLs791AneuvubAXXAp8C3bM+EO4za/QJ8mLOlsblVHgr
         r0GEdat4NIx0IDjA2k9FITYc2TO4+n3FbyKreQGAfFP79b8b1juoN6eymRdcB/nJ3HVS
         Ub+wv8UmAc75nlIEf7hsHa94/5NxXhjtuqIdXlCpshyCpvnT4ohabqQTxLNStKjAHEyq
         qbMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=kGWCkxOf;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e header.b=mPXczKDz;
       spf=pass (google.com: domain of andreas.messerschmid@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id 14si822925edv.4.2021.10.06.02.32.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 02:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of andreas.messerschmid@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
To: jailhouse-dev@googlegroups.com
From: Andreas Messerschmid <andreas.messerschmid@linutronix.de>
Subject: ivshmem-net on zynqmp with hardware based PCIe controller
Message-ID: <001fe6b2-286e-26b3-c820-6b184cc5c76c@linutronix.de>
Date: Wed, 6 Oct 2021 11:32:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andreas.messerschmid@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=kGWCkxOf;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e header.b=mPXczKDz;
       spf=pass (google.com: domain of andreas.messerschmid@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=andreas.messerschmid@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Hi all,

did anyone already implement an ivshmem-net link between two Linux cells
using the ZynqMP PCIe hardware instead of a virtual PCI interface? What
about MSI/MSI-X in this case?

Any hints/success stories on this?


Thanks,
Andreas

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/001fe6b2-286e-26b3-c820-6b184cc5c76c%40linutronix.de.
