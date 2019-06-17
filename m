Return-Path: <jailhouse-dev+bncBCTN5UU44EMBBPUQT3UAKGQE4ZJ4KMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2348270
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:31:59 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id f36sf4827557otf.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uT3h7/GBjetEl0Xk0bDV+CLzMKnBOirp66vbxSRX1+g=;
        b=LzooYCNJtd/n24hLU29qEyAMGqKiO+36T2KvbDfUjmnDtcLePaJpgMDSwuidqdfzKw
         khrXm67zVFChDLhe0cuW2fUn5M09Rz2t+cYMv/T3joMYw7inJSPNLkThRay5OqdY00F2
         rIRZEWFdkZDcSmveSfCbQQcnRGl7LdPqaDICGCAP1f8hX313OwkwkPtCXb+eePQJccsn
         wxahmSLGbhriRTN8mTZTpMzS/PXZ7UrWI49XVrMLcnpxtZmT3iPKU1psQkKl3C38s9/7
         UTM19bIaCXIEelLupF8lJmSfExOu+EY4tNIQSNyQ0b2iYYtaeDlv0K8+VNF5x7FElj2+
         xDWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uT3h7/GBjetEl0Xk0bDV+CLzMKnBOirp66vbxSRX1+g=;
        b=inPr9f4kcmPDh0gjM+5vKrN+ATuP+RbkyaoK5e/He49PTX64VS5FKtYhnFaksCMi4p
         vyre4o1ytHeT6SXiIPbmy86OsH42YbfrToPhv6uJ2zu/chye0r6HwKifSeo7RlDUXwjs
         KjwDHcPlZ2wPC7/BUgtFbvGcAJ/g+sewpPCHfU1AWq9d148EkAZUB+sUwOprh+mAbKdF
         C9jrat4ilcsexaZb8rSaHm3GWsA74HLT9FA115rkbdkm1r9UqYYD9Y6SZQPuRmsZhprM
         Z1yYvU6Ka2+0aEtdlJBmSHkGp28UEyaCa/4rVBXn+tk2mKHbu7+g2/E+wcoMSpLQ5IkX
         ZDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uT3h7/GBjetEl0Xk0bDV+CLzMKnBOirp66vbxSRX1+g=;
        b=AWwFtIwU6glwQ3OEbdM1JPBZLkalpJyDgJPLZ9dnta+Xj+kedusSkWGK+wWxNfTqlQ
         6NUOnZbPXNdGZzvqKdwW+OC3ujd5wOy8W0IWByeT1Fw+DowW0wSBx6+5xHinmWbIAQIT
         1cVLq5Fc0iSrnQMgV7Rbzu0nqCDBszoGrBRD9XFSOBkpqtJADCSLATA8JY1E46KVQDT1
         dylb8LAaMW3IPeiw6+iPCmJVnN2rlWXW8TyugW0o2nsdH1Yv9/nNvk+s9tF9u3RTtaJg
         44KJY/egwn8M+2rf7DWdgM1CO/wiwY0unhnBG+if5y3iFFQBbWQRyNyk2lxwMUFh/jGH
         Kbig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAU4N6xHYEVAqa7bssBDFFkJd76cyhcb2NFj58sVxEnei1Hcm4
	JqUuddHZDcfQPSdLP4Fe9ok=
X-Google-Smtp-Source: APXvYqyrem7o16kOLglOS7/YI+ozP6swmxaM10ubBboDao7bB4l+JNa3gSpc54bNjBF443DV2A71Gw==
X-Received: by 2002:a05:6830:104e:: with SMTP id b14mr58712905otp.264.1560774718654;
        Mon, 17 Jun 2019 05:31:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:dd09:: with SMTP id u9ls1625408oig.6.gmail; Mon, 17 Jun
 2019 05:31:58 -0700 (PDT)
X-Received: by 2002:aca:c584:: with SMTP id v126mr10361578oif.60.1560774718128;
        Mon, 17 Jun 2019 05:31:58 -0700 (PDT)
Date: Mon, 17 Jun 2019 05:31:57 -0700 (PDT)
From: johannesmaisch95 <johannesmaisch95@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cdee0865-fb6a-4811-837d-b48ba82925eb@googlegroups.com>
In-Reply-To: <20190607073050.z6bwedzkvwvy6u5l@jpc.jpnet>
References: <f8c8bb48-ac7a-4bd2-a554-0f42a31fa5b6@googlegroups.com>
 <90eb1048-d5b5-7dcd-fa9c-ff9b715bd97b@siemens.com>
 <20190604102704.7xy42j25eq2h67rq@jpc.jpnet>
 <9d12161b-a004-ad5e-0dfe-1b1c249358cb@gmail.com>
 <95b6464e-f439-9b8f-8df6-2ad7281c5cf9@oth-regensburg.de>
 <20190607073050.z6bwedzkvwvy6u5l@jpc.jpnet>
Subject: Re: Freertos-demo bare-metal boot
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1576_122836995.1560774717524"
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

------=_Part_1576_122836995.1560774717524
Content-Type: text/plain; charset="UTF-8"

Do you have any ideas, how to handle this problem? We adapted the start adress in the linker script, but we couldn't get it working. Are there any tips, how to handle the problem with the MMU?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cdee0865-fb6a-4811-837d-b48ba82925eb%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1576_122836995.1560774717524--
