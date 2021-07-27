Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBN5IQGEAMGQELOSXH7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8A3D7DE4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 20:45:12 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id b8-20020a0562141148b02902f1474ce8b7sf173446qvt.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 11:45:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627411511; cv=pass;
        d=google.com; s=arc-20160816;
        b=V2dOh+Q62UOtYr/skofDts/IWzBNVVLESOZCC5ZBUjv2rEp3UATzx1GESNfuqfq48H
         +c15vwi9nQf3x9+tZwBhAJ10jUPGkVYCCErujqIv7/LUpTv5w9cdJ4dAH8uuM7JMIlpJ
         DuxJMz9sz9pXvM/037sZD1AMs2WrrwC8OZKKHuX524injRSxXECD/8ubd9h+oKh/tWdI
         ZnQP3xJdHKOr7MdPQPDw6NPp8E3Ucw8axx/mQHH7hgOdmqLQApHfbvewTV3nNiT8kQ2U
         mI1lBrh9kBkh3+loMPdZNNSFyrrvjaDKaA8KbSo1k0aEabxdc+HLMTeLwakvmeL+13k/
         TFrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=VjbcSq4RodTJjPcBvW8XpZMxexBwEMBsmAG1uJsWwbU=;
        b=wclSwWiJKYJZssOrT5JnGOiXkx+K5GFsmUeCaWrR/7zmhtjLJlTJG67EExkKrIDOEd
         LjhUnrZsDHcRVpgFh1VsI2Pl/HrB+SdCt7m2xwtBzmm1gA0HwATNfRf+79chhMgRT4pH
         5TEBtUAFOC7MoKk5IJbDATflYmpNOWAwKw6WnESWFysq3UwKsytf35swt16KTsRZbNOy
         qcXh3HdBHgYqWpkEJwh31AvYr+VVQPzqelrbC4ZtHlODt1k1k7p5bhgdeHSMJ9K75ziF
         XvYoujd3f97MO5aySk9D5lWuD+VLmPjbwd6jEbQw8fhOAYVLu52HoA53Axyn/rchNZ86
         v5hQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=dju1Yijc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=VjbcSq4RodTJjPcBvW8XpZMxexBwEMBsmAG1uJsWwbU=;
        b=YuL38X7cvgR5zBMnQAmJ7hPqnbqVi74WgREHE4zSSFGWfZebGexNhQwfrLdAWofn6/
         bfrRIRwxtI4C20CHrtTQxBHETawvJngNfXi/NYSyWaUBfFCIPsjhiJs+F2cMGB09dJWR
         HiQ+fvVKkTqVC07ZHP3vTQHHVCBXpwQbwureWbbbVlhuyeHm6cbP7g0WQ4AM0Wb2rkDK
         M/WW97xbPi3PtL0VLzProUxtUJv097HJUm9K05F/WbGjCyVBm1AkySfe13Lfx90In4A+
         ZX14cI40HnmWWSnO67oMc2VHcHA89pkLpGGN+rTBAXGwavmgyBl5Q+AgGhEBFDU2oq66
         oUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VjbcSq4RodTJjPcBvW8XpZMxexBwEMBsmAG1uJsWwbU=;
        b=jZY8tB5xDlbX7p5u9/pmGNNjwHVWxtPILi2XHRYm/2YqOMx8VXmUYAaumt8HRgLenZ
         OoNken3YgJG8iYj1t3dG/HVnRBxteDJiC4hmRHBXowxa5L4FfbNpNpLjGeNrNmCXxvDt
         fi+208P6HNChw2Q4w9NRdm8q1LBntN1E7OWcSN/98d4HZHLS1KOsZzvB/rFCHDwqAzz/
         oQ3QdOboOMgW5Xb4H7DVm1pBplFlS0y+MOQJFQppJA2djKM+2ggJejtmy89NkGcgnIuf
         CXdqJ1NLWPrar4apecsYtckzCOUkfaDNSbUJNLPJnzVgtJCZKMEwpEPDO9AIctpCIbzn
         xKeA==
X-Gm-Message-State: AOAM530+t6kkSyfdKjX6Jct6sIyA1nl6u/b20goByXsQaapU9K8RU/Va
	YXgPoA34c8KNinD0vv/pQLo=
X-Google-Smtp-Source: ABdhPJxt2ofdqu/BnJVuDUCP3eCXGjw5YAitT+Q+/tIgELjly1WUchWGmoPOyQFRo5zpDCdWKDhwUw==
X-Received: by 2002:a05:6214:5085:: with SMTP id kk5mr24622864qvb.25.1627411511373;
        Tue, 27 Jul 2021 11:45:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4cc8:: with SMTP id l8ls10793312qtv.5.gmail; Tue, 27 Jul
 2021 11:45:10 -0700 (PDT)
X-Received: by 2002:ac8:6b99:: with SMTP id z25mr20887982qts.150.1627411510751;
        Tue, 27 Jul 2021 11:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627411510; cv=none;
        d=google.com; s=arc-20160816;
        b=sLmVS/1YnHYDDQry///8M5GsbqZrmTGhzgWQAU/MSHbOTsJNSL3YY8cxgDRWXl4c3a
         kAkUYUAiSVF22wO1XnzsXQl5LzpJMR3Mz7CxQYnlAhsJvfpFg7bU6HZC0CDjb6yav2ks
         mbGH969o3Esjzu6yPCt0X/P4MaSovRMydCyAnk/jvlvNLiSGjedx+hjLRBPp5P8d2Cah
         +iEBtUJBcHsnHNouP6nFuCH8+WZaFKT6WZaYQkXl+fW5K7rizfWk/ip0XhXxNfKgudM7
         Nd+6Pru1O2sySMlv3udNH6UZN3gWiTFR+MkfAwhQ2OBUn7I93fwFs1nrDMHz7wXavcTL
         sosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hUzTMlVNXSwtAaC2Vqgl/zCA/Cc+Ypo7vUiOw3XB1r4=;
        b=WCJs+AE4Pth+PQ5S+mEtHlHOz1g4F5NjerZZ8zIDcWE3JxXFH3OYzf4WqfyuIgENs5
         j1mdmKO7y7zR7cbUljkGf1BQpKAKxUZMLjyO2n23c5GVgSxTF/fxxk4+RRy1gUfRXr5q
         fVqpQXtFb3PKXDqPYYPOSMSj3QYroR9AMPyqTMfODbG1bLWOUAWxbVDyIhryLE6b6T7w
         zUyosfSDCIBJuGvcMW5uaFMGjtujqXYFoPTI8YR2VlA8ErwyXArPvA0BqNbSyM8lj1iI
         c5/MuSl8virZlP68XLniUbaLwhnE6uWuG1yOL7aKME7l6NL29KqfGtQukRSymbQAenZ+
         vQ9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=dju1Yijc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id h9si216532qkn.2.2021.07.27.11.45.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jul 2021 11:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github.com (hubbernetes-node-43e790b.ac4-iad.github.net [10.52.200.67])
	by smtp.github.com (Postfix) with ESMTPA id 947EC560F31
	for <jailhouse-dev@googlegroups.com>; Tue, 27 Jul 2021 11:45:10 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:45:10 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/630001-40c4db@github.com>
Subject: [siemens/jailhouse] 40c4db: ARM64: Set the right set TCR.(I)PS value
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=dju1Yijc;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 40c4dbdf266552dc3cb1f303fd4774cab9ea5aef
      https://github.com/siemens/jailhouse/commit/40c4dbdf266552dc3cb1f303fd4774cab9ea5aef
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-07-27 (Tue, 27 Jul 2021)

  Changed paths:
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/paging.h

  Log Message:
  -----------
  ARM64: Set the right set TCR.(I)PS value

According to spec, the {I}PS should be never larger
than the CPU hardware implemented physical address
size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
may lead to some unexpected issues.

we can refer to DDI0487G_a_armv8_arm's description below:
If {I}PS is programmed to a value larger than the
implemented PA size, then the PE behaves as if programmed
with the implemented PA size, but software must not rely
on this behavior. That is, the output address size is never
largerthan the implemented PA size.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
[Jan: changed comment styles]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/630001-40c4db%40github.com.
