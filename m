Return-Path: <jailhouse-dev+bncBCTN5UU44EMBBRPK3DTQKGQE6HCAN7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFA342BA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 11:09:27 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id f30sf6195900oij.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 02:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gGSwm8kF9MzVxPGx+sHZk30e4x7SUy0O/nKNrk5LuVU=;
        b=YSjmTm2U1jT3BpNRWr6ZfRDHmodb0tYwU8wySn7n527pCqdHjhdTXdhT227munZydj
         eNAIksXZTnH+ZljNOgJ6En8/gBkHPRuuXPGuHGPmPlTpfbIfPJofmkuqFY44L/RYWSDT
         lWqXicYs1eAactaJlWs3dESrd0qx/xGMsSj+1stxe/19RezsjOh7bs65AiOtTJHyIpsy
         zFenER7z8ckPDtSkEuO6gIIjyNMUpAAliABx7f1/W70iDbpgKDNcC4cJhgSH4MMf0goW
         vAFudLni/FpzGCweHISG8LqVv41u5vtKC+UuJOcP1+3qVVhvngudVzPlmdNx0zYKIxIZ
         15Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gGSwm8kF9MzVxPGx+sHZk30e4x7SUy0O/nKNrk5LuVU=;
        b=seZ2TCsD2/RH22kmly/877HxFLV6+R7pglaJXOe1ucNiroIHm6Pk5qI9ArGyL+VU3J
         1TTEYGroNIWAYnzTvqa+C3YjbiHy1IautXVGss4PB/M/Wil5x/ANOHfLRbh7PGWBFJzR
         XrWmUzpxOyDkzzSV8J24vJwvBST0V0iayqe0vn0w8LpJrJgLeapTVOhwGND4xobpA1vI
         ZqTuQ7mYmPjvuCB8hlGigtxSpeG33lGEDnBg1X2hLqmBZ/MxT1gSvzYfO2MSXFKLjFNO
         lYDx083ymteyrUns/hXeF/7PKsfE5VB71vy20hJ/6KoNunOa1sFoCc0dlC1CPaO+KfAT
         IaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gGSwm8kF9MzVxPGx+sHZk30e4x7SUy0O/nKNrk5LuVU=;
        b=Y747aYI3eJ27RTa5wLh8eU2upDLmoly1If+owbelLM9cKFcH4PAv1ow6m64eClWZtn
         TsmBj9kRQvBFMCIR8kTGd6vGvK+l+gk90KFLiLtrUZlgmQkqzPMEs8W/urnO6py4vjSn
         LRKJUaGPUII+JDq06o2BaZa9Xm4Y1yeGfGjX72GuwEtVM4ZW2to0ZItyni7APLiVytyk
         oU/jWuD8Joyl7jxFd3/DyAaJsOvar6jUUdQxQ22e1EJVUMqXRhctREjKHAOdwz6cocAY
         pJs0qCxG+GfwCRwcoVe+cn4eBcJNIgXAZ2wxO0ajAJq0GTTCtGUaphZ+r5OfVEQwIK7O
         z6iA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW1JjUJTkkx1MbpsPpm/p4iHF2ZtJWnTLPm2yLKejw1NHrOPRia
	zDVKcOVudmQvxqdNzsfN5EM=
X-Google-Smtp-Source: APXvYqws9aNxWI6279JfLrRCCH0DKFfMCEHHDqs8IEYQI7NjTsHZwTb1l8QqrgxT6tSXyJqLcUam2Q==
X-Received: by 2002:a05:6830:1042:: with SMTP id b2mr42025otp.345.1559639366008;
        Tue, 04 Jun 2019 02:09:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:47d2:: with SMTP id u201ls775490oia.2.gmail; Tue, 04 Jun
 2019 02:09:25 -0700 (PDT)
X-Received: by 2002:aca:574e:: with SMTP id l75mr106852oib.2.1559639365354;
        Tue, 04 Jun 2019 02:09:25 -0700 (PDT)
Date: Tue, 4 Jun 2019 02:09:24 -0700 (PDT)
From: johannesmaisch95@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
Subject: Freertos-demo bare-metal boot
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2135_1428925555.1559639364665"
X-Original-Sender: Johannesmaisch95@gmail.com
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

------=_Part_2135_1428925555.1559639364665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we want to do a comparison of running FreeRTOS on the Banana Pi with Jailho=
use and running FreeRTOS bare-metal on the Banana Pi for a study-project at=
 Hochschule Esslingen. We were successfull in doing this with the Jailhouse=
 hypervisor, but we currently didn't find a way to boot FreeRTOS bare-metal=
 on the banana pi. So our question is, if there's a way to boot the freerto=
s-demo.bin from the freertos-cell bare-metal on the banana pi.

Thanks for your assistance,

Johannes Maisch and Daniel Schmid
Hochschule Esslingen

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2135_1428925555.1559639364665--
