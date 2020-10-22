Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUEQY76AKGQE6PSY3MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A429643C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:40 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id f3sf1016372ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389520; cv=pass;
        d=google.com; s=arc-20160816;
        b=NPvcoSSEag/n3E6ZITmM5/JDkyjNntDV8xPXWYIuXkQum4PJRmarY9jm+JSfDjfpNy
         qasH7WRP9ef/k/XWGIKXSQqxrQui1MAZqDHZNFgzA1tTAHmxDH3Pn9Gz3eyPJ3pEYMh+
         chXJy5+1yYtHKzzMb7KeoLyoGk7D6MmUzm1vdV6beL0YA8YsUgMmE6qqV/WY+LAhN1Mq
         KoQVy2q6xVcW07L5zC9ckwbVVk2Ld1mp0kBGec9D6rE2fJFuEPbnWUGUvRaf7WOKi6Nw
         qcVsKWiXSYC2YEheTWys10n/Hs4Txg3ULsKoZmd7CP0/IsG0rElGvYhWNCvFJ9Tt1geQ
         kt1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wzPtzaYAmoLzFlUdB+NVDIL2SMfSXnNlN48SPuAVvAE=;
        b=NYKHg+BuWCJMo2gy+/qVEk9vQC4JZOJX+i9hu0Eq1Fu05yNP1FXp8l0SqJg14mhnoh
         ZBYxqDtehq3cKZaLBE6d0cNh1fNymrtk4+WbkVDIsVL7/7AgITUfp1CwSBHRKHq3u2PJ
         rVlml+qIxFic8vCLvZIHfv3VjfnOUOQdaJDL196F2vxLWwiwX3Y+dIX6sXKiYSkga/27
         0dE2eul+ppKE7O4ClQpUfdbVr5r/8dMbx+letrRHmDNtmUTuMEDpnulT/GE9EOzPFnlf
         RJ2IwHbmhYLTF7a3clr2csrLabKWZSR2UAcsK8Ge23xt9Eexdf5JhwA6n9lZLcom2CoQ
         BJtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EcnNyutk;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wzPtzaYAmoLzFlUdB+NVDIL2SMfSXnNlN48SPuAVvAE=;
        b=hlHeC5ZRuFY1MmZ3iiKuR2ocMaGo6GbUTXDtP37dZyn+5ky1S640bOT9XTY+YtUJg3
         4kKwzAXMM9s8b2mEKQuVqfeelYpSclimgpvdovkbqQ6y49RXHz46XOCJCzJLcbt63zOX
         eIpQBsrfUlVLVLpzzlYzM5HLdxB7YfXIVmL9AtfXTGG4DWog9jezEi5k56skFL2p2jmf
         RCyWT6OBr2WxY+Lm5o25B1gOr3G3Tv2PRsz+5rZ++Jj63+VHiWBIp7eKIWyyCMS12I9E
         j+fcmqHVvqthFkrpTBgvRWSzuWOrUykF/lq8ZUsnGEE/B6XgqDmtk5U7Tq03WA6H6CUN
         Rvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wzPtzaYAmoLzFlUdB+NVDIL2SMfSXnNlN48SPuAVvAE=;
        b=ZRkk0Zry5enk3zNP/ylQ/DgsRFeDeY4C6HHhac4s+Tp1iCK2Y55OG62bMHMQnk8SPL
         Npam2vgOnn+OjXXsD2+ZNpmK4QxLv9fE0mRM8NZyIE7OlFWreOHTAIpmemluDpwg1ACT
         yM3GD5zKgAifTJY3oBRv3d4HB59lsDuTGQN9/8d9IKgjCupa/TuKZ0wVTVBfihq5TZNX
         4DG3Jvb/cEoJNhLJ/K6E6JIW+atUIaDkus+J6l1Ea733WdWBKWuChIPfOt7lSH5YICtL
         c1BQ5g8EPnhw+Eanqui8HP6i5BZ3K24WUhu7z/LheNazxAVAmo+fFWkp1WUZXyxYoZWQ
         Kahw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hifcZUaF0iysXAQob2+czKN2IqZEwJ6GBx6hQPIktr+yu9OEh
	ixoJ/jRwGlJoj0NHWqbclkg=
X-Google-Smtp-Source: ABdhPJwEateM1U8V+aG0pDrgnnL2/JIr6zsyiS9nzOaP03Z+lHImgDklNXwj+WDEM1ubu0OWiLXCXA==
X-Received: by 2002:a19:941:: with SMTP id 62mr1344377lfj.227.1603389520475;
        Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1746903lff.1.gmail; Thu, 22 Oct
 2020 10:58:39 -0700 (PDT)
X-Received: by 2002:a19:650a:: with SMTP id z10mr1352570lfb.9.1603389519326;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389519; cv=none;
        d=google.com; s=arc-20160816;
        b=cYWlxP0kcY+vWTanDWbn0XjZ1wP6/JmN924YhB6arKAOy1lD3ZN9+wvDWlE6JH7QMb
         fNGhgZIC5/fq4dWMp4iAgVS9PWVtVOemQ9P1MYStjBOZfo0kdQdw9ArPMsCUNxQ5rrrw
         oJqKF/8HwvVQ6kXGQVPgXjPC303NmwxdO10jwRzOaBQtpPw+K5uh+PFT8GqfqJzBpfvN
         5xBX/Zy62QSVvIonMaH8CA+41pZytKjiKobFBmKjHvS5uvBMzV84z9Pz/6PzHEp+75zM
         JQa20TjG7ifYeQAg3NOutmoGihrClVMFQnVVGzfQmAVOBBnZMLmTakzzH7pGaGpS93jq
         9R3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=L/KkECuqG+RrwYPJ6jEo+Kj8sxBlTEMDlqBirxTXdxw=;
        b=Nmjt+t2nRcdZpcuY2FFbo1X1JbjSgI9BqrMwiZ2pICkUJs3S3mj2YDy0GcIOjeOYiF
         m1KPMelXKRchDFy+5HjrU6Z+kdWseif0ZgJWgVo7eBvFHZwJFch02VCXhWPhq4IvSVDf
         An9GqF0Jjy96AqZ3CG0i+abfKlUvCch0SKuGh30OUpnFMd3ZwoLsHxiot1HEGXKzGS88
         2poi+PgwGq5OuJVA+rvB4D6so/hFzR5ai3jQQ9w585KkUxYE99ChDxHnqTe/A27Go4jr
         cXrpMI7anfYto0A3Jpb7byI74JeE5VD9kmI3ld02h2QSsiMUS9KxnHPpbucqIYc/XEez
         zhSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EcnNyutk;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id w28si89288lfq.3.2020.10.22.10.58.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTp57nDzyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Je77cveadAUG for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTp2FrvzyZr
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 15/33] hypervisor: Wsign-compare: force the "right" promotion direction
Date: Thu, 22 Oct 2020 19:58:07 +0200
Message-Id: <20201022175826.199614-16-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=EcnNyutk;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
Content-Type: text/plain; charset="UTF-8"
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

Only part of the problem, Wconversion would complain as well.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 9274a0b1..fe85ae2f 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -24,7 +24,7 @@
 
 #define for_each_configured_pci_device(dev, cell)			\
 	for ((dev) = (cell)->pci_devices;				\
-	     (dev) - (cell)->pci_devices < (cell)->config->num_pci_devices; \
+	     ((dev) - (cell)->pci_devices) < (int)((cell)->config->num_pci_devices); \
 	     (dev)++)
 
 #define for_each_pci_cap(cap, dev, counter)				\
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-16-andrea.bastoni%40tum.de.
