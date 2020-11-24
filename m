Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXNX6L6QKGQEQUVLCGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC8A2C1D92
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Nov 2020 06:36:30 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id o19sf4115795ljg.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:36:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606196189; cv=pass;
        d=google.com; s=arc-20160816;
        b=uu+CzBuMGQOI80uIL9aDmrkdzSNIQ3fj66igzHjL2NPMcL7qxn9/kToPYiLrsUzXm3
         I5Zo4VO3K7Q5lBdSWepMU4iIy14fArRHKyfxUV+P/r0g2PF8Ln+J6eF9ZS03E9ozPOQA
         mNHNSitdL7PI/sPswrhIXaEpGZosS+8jUSM7TV+GuZ+x0FCWsO8Qi3bPo17h+jTGFIn2
         w4eaM41rDvxU10TOlO+Jqg6i5DiupZIS/NkQxGXhEhGNA6S/hq5ilOySl9hcdFha54fS
         EsXv+7wQh86BbCVxAmNdftBVQZwNkHOrfsS9z8uJGxoaAmIImaifhUpC3gg+P7fnyB01
         H1PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=C1DNjWdjgPHzmwMuND70UlXtjhMN8ZFP7wvzDr04VNY=;
        b=tY8wYwfsv5hDoJ0AjnYmKH7GPVXD+1DxUGgY1aQysbVYx8jPvRqI9gv4yEcBrjPaeH
         AnGbI++0OfiYCs/jw4jyxP+BcT2r69N9jFjiUQoizGrVXmZc+3537NGWvHofrlYkMVSK
         zKZafQhqKYWB/bAr0k6FW/A2+vj4UVRwRuczXnCo7uYDSHUb+aveZhXM53CdB4c8zjLJ
         C5dkYp2iSFnJ+CqvORHfF4ZJinOjJ9TqYk/vSLgmPwQhjkWqE479CQlmsDAV0WgMjInW
         upPjlVKdkqTwhnddVzyLYsvw2ehD30MxHHMXURjcdXgF8735P/tsxCj+g3pZPp48x9pL
         ujog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=C1DNjWdjgPHzmwMuND70UlXtjhMN8ZFP7wvzDr04VNY=;
        b=gfQUDoFdIi+bRnIlqpwSr7DStIFgC826ZCJ9RFSYGqBZcTuAuQV51L/TSrEq2wByqj
         wmGimM/FbKCVoswM+W0roFPXapoN1cYQ7gs94mFTcSuLAcqXueNSobmkTXvBZXUYiQxy
         0DhTUsvSK3R+w4R17nRLcVNOV8BX3WY3M6bzhXimL3B2eneO6W7sZ2ML0yOlszVkYaLv
         Cgl49JGd8DE1qA/FMvO0Omm5Htjr8p8Uk+mIiIJk3t1xbFLUEOZ5tlNxRDINuuH75bUg
         h2O2jbXY1FxC57I8RDVzL+I9+CpkSCgN0U5KzucZTgw5QcZFYgP24Azty9iF32YTQaIB
         ePIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C1DNjWdjgPHzmwMuND70UlXtjhMN8ZFP7wvzDr04VNY=;
        b=EMKH5y78bmtCTdKb7CknjsnU0Fo3S35RT02ZxQrEgql345ZhnKmhlu/J46ZNxV3/kG
         TdX7qD+HE0kE97VBrYKqS3ZRYbMzdOoCYbe92NeAxz7GoEkxmZPhwoG7D9/+3YHZ1oe+
         eLkSntDXgp8P4xbT7+eQM88D9Wqhg008gBIEs9CmXgDaUhgRdGtfTSafpTbh3YvhH99A
         VKlfKt0sb0d0Ira/j7Bg8B9sK3FuBjWyU/Q8u9zi4Wr3y2dfAWyFgiNSOHpNcsK1b0Ad
         QCj9OPIORGOYAgVMCptbP4VNdIxetX7sswDGRfTxkW+kljkAc3GzytZv2bUDgphnn/Uh
         RKHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ToLlKcjnW2rpiE+W/ewzz74aAKtq724axwYMF3OmBHfxc2/5d
	Micnu5zX2OJxPq28brAOPHI=
X-Google-Smtp-Source: ABdhPJw8PAGgVky6md6zpzdtztsuEgm67HTcQpSXXT/L21BESaeNWNg1scUoQSXBpplMljPzX5zE6g==
X-Received: by 2002:a19:4090:: with SMTP id n138mr1112013lfa.297.1606196189799;
        Mon, 23 Nov 2020 21:36:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ccc2:: with SMTP id c185ls516204lfg.3.gmail; Mon, 23 Nov
 2020 21:36:28 -0800 (PST)
X-Received: by 2002:a19:e059:: with SMTP id g25mr1147673lfj.584.1606196188518;
        Mon, 23 Nov 2020 21:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606196188; cv=none;
        d=google.com; s=arc-20160816;
        b=S1OIBkl7w8Hs1B59hxEOpzmbKDYE5lktvv21B+iDajXPXPVj5HzkNEfTeJaVL8yppZ
         /uKBqlmsSC+SIGJ6Oi+bxAgMJlv2QUNeW0tYeNFT2zNbyv5rqTiVD6RgxZTAjCaeirdW
         lbFy0cq3IgZTtYDluuMYevo1cl8yloQLMBTtn6lffXhAMW7XUazDY/WRd0xJ/8jwWdxW
         H26Rb6CH4ncAev42F1aVUNyCvdHWdhzERBdkL0F8OXZGC6qci5FzpjpsVHxWXADI7VOb
         WjyPNm9MXXTxpesG0e2+yDlMPVRgTehysTNDnk6Z8D21BXmFDmGzgAAHWO6F5cxINTt8
         P4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=kaL9kr/RM4dmisLIrpp1V40qRNWETHykz8AKgxifGzE=;
        b=KTUsfxJF1DX2n46/YZ/6yqvyVgSTPEFSiDxXTedbHK8J7UHweawplminfYy4eiNj6m
         V9M4YcCMmYMRpEgTNOLlH/lCUhQpbyqDMURMWfJKE8MEhTydpfwfobBDFrsY5sTP8NwZ
         Wmr31FA79OrulSGhjxWjirqO8oHWzkMxPRC8JTXG0tqFi0gV+L0KKAkjSV0Ze9z3swYy
         RVG1AqCq7KFCGOcg8dovVKyHcXnrZoZtCcoNLWHVilhxcVT7ZRamN42/A0LIeBGlYPLw
         9pC3KhiHnElNLmZ+8yR7e//Je0qvMcQpoqEIm+n+SGVHr/QgRZqUu43Xf6BQPUSH/v6j
         7jIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o13si474811lfo.5.2020.11.23.21.36.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 21:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AO5aQxI005643
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2020 06:36:27 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AO5aQ77023023;
	Tue, 24 Nov 2020 06:36:26 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm64: Fix build of k3-j7200-evm dts for older
 kernels
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <b21d992e-9ec6-3017-0ad0-1294995751a4@siemens.com>
Date: Tue, 24 Nov 2020 06:36:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Went in unnoticed due to a reporting breakage of Travis-CI.

Fixes: 4fbecb507cd2 ("configs: arm64: Add Linux demo for k3j7200-evm board")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/dts/inmate-k3-j7200-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/dts/inmate-k3-j7200-evm.dts b/configs/arm64/dts/inmate-k3-j7200-evm.dts
index 3baef5d4..7a3e6adc 100644
--- a/configs/arm64/dts/inmate-k3-j7200-evm.dts
+++ b/configs/arm64/dts/inmate-k3-j7200-evm.dts
@@ -11,8 +11,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/k3.h>
-#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+#define TI_SCI_PD_EXCLUSIVE	1
 
 / {
 	model = "Texas Instruments J7200 Inmate Model";
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b21d992e-9ec6-3017-0ad0-1294995751a4%40siemens.com.
