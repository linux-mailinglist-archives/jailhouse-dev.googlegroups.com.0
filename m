Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBEZR3WAKGQE4SA3XNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA37B7BC1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 16:11:17 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id a4sf1132497wrg.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 07:11:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568902277; cv=pass;
        d=google.com; s=arc-20160816;
        b=vD6qTmsQAPpPM9S1DrXvGZHZidz2B5TQ4IVW8QA3RYN8DGvFGiWOqPiEVmXD6zpFOs
         nlkdPToGh5m+tg50tpPLNVrLn4SrDD72v7YuSXzj0AVTrAwW/9lMZD5/9L4kb+pjYXWk
         iGRXggP5TMAjHq+oNl2jL9PXOyRsCv8oH/axOmK9IVjgfsT3AHYO5LYqJzzR8I8Ml9jX
         /wln47SfROQkiicc/QGGnWlxBN/Ts5WARX2YwfDBetUsGzXLno5XIt1R5Lf4MfaKpfOg
         zFx8/BqtkNF6TY3TbMz+mxvierQZBs7aWa76gN26iTQ290box6TVue01pTfAvccl1w5P
         0cew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=h3fD7mCBE48pht1u4eO21vvygcRlI/Irx3D8hPrapiE=;
        b=eGqPnZ2/6cB8okW/9+20Icop5ieXeniqGWpD/phpm8mnd/BI69+qN0OmLB/sdM4JPw
         RnZT018Bc2xFfs5XqMN5o1rrw6DbpSX0sX2WkH0nCARsJlIs9DC6q6faFz2kzhxEZgFd
         S/U6jh4Gt4VkwQ1M3vuljgz/jb33gQ9/mBMvsfsB2uKsr/Uv7/u/PtS6YftEJ73mhFxL
         XMBPaFJDxydYZiCsm/c8+oDV97GT/AYK//+a2yja/VJcdV6eZSLFjOtU0WILEQa+J2CN
         2WZQF+ixM8+FRtJNnJTv9xxu4aCJl3VQ660Ok2Xsq0VNoBi3j3oKzJcA/72c8CBy26/o
         Dzzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h3fD7mCBE48pht1u4eO21vvygcRlI/Irx3D8hPrapiE=;
        b=TJ7AN95X6t1GggHHfi6PYfeozl/N/NXVaY7LxgZojcYwIRB0biyelYNv/gWyhE1xI4
         aVX1vzIaR/kvMiuRAASG7IwvZ6ht0PiuywcfpMDpX5jYOL/XplkLPrZL8dX7HywOzH1o
         Kgk4J5rpGYxyAilpWeRwY5rukb5mTacMiQezeA7Nj59sHRnNmn7kDTN+LTTlZsVtZemF
         0FZp0dCHlaxjlwhbjCCte74lOAZ35apUs51ug6d06m3gdkQzKWnGdEk8CjSApOrtDhmG
         HXVS8hFx1Yd5IdoHyFpFz0P6Owl0Bftcwq/ivLEcibBZFAChHz6vd0r3bKto8MBqjwpJ
         YBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h3fD7mCBE48pht1u4eO21vvygcRlI/Irx3D8hPrapiE=;
        b=r5Us3G5Sttrjg3YlMMLqSgVp3r8+gMjFcsUzzAkkn/t9oV4zxG4Hm1Amkma4rc+e5n
         UPIK1dhSE6a4bsrJyzK+Ix2vK+UdDQhphqKFXNHm7Xbm4xcG4iBYNp34bGui7T0s+LUI
         FcRSMMy9xC8xpaafww9+SSaIv91uIVOUCUBwIptpksBnbCInRbTf0J7ylKxVj4LSY69T
         Grq9GTX9nKvuA9l+hXX8wl3A8PCHEeGqkWF28aJwMDRMB+3pY4Wn0HWTgzvPefdwD7gh
         F2iZeT8PWZZj+ThyKKyJ0UTVs2UlwMW5RnVBx6w+m3dBw8RqIzi5XezG1B3O95BTiesb
         2CxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW1+2U4PfZBNvuDTJKHmtwWCg4yG8/iqKAifszaL/tIzCFms4J4
	bi2KYerMjvDJKEW98FZMtfY=
X-Google-Smtp-Source: APXvYqwHNsgHMUkAZkig0aIZvqvEQKjniyL51XAyrzzvywXpyv+dJZsGK9BDpILvu+aWuLmwKCfXVA==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr3111646wmb.73.1568902277376;
        Thu, 19 Sep 2019 07:11:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9d8c:: with SMTP id p12ls927938wre.1.gmail; Thu, 19 Sep
 2019 07:11:16 -0700 (PDT)
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr7379267wrj.277.1568902276411;
        Thu, 19 Sep 2019 07:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568902276; cv=none;
        d=google.com; s=arc-20160816;
        b=zCZaDaPd/wlWGhytaefPkdHxSz57jSTELT3e/zW0oaATH5pmaITCPjHucQDO069bH1
         K6XexWMP2Lao15nmNOs/hHUUZLPfuK/tzm/7HPQwDnAwH4qTCU323ZDeFLdO7CW2iXqa
         V7OoLh4mAOEfc/NgUb8lx+kjP7SjxlPDLwEuOt3TgHYvtYBES9X1sQqdh9eWvDQc90Ki
         oTfW/oo6hpKbtmsFScG9Srok/yAD7JWxTl0rSHG7DzwI14YS1DJ0oqu2OJHb5ugSnue4
         8ZJYecSXoW/iq1k8tAbfFUY/sr/6bbuw7jNdBxfMZprjKHIa6jhK+3y37ZbMk2vBc5SG
         cjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=gXFZBOBCmkYyCJ1yFo7+spJrmZD5ktpEu+O3ShsPvA0=;
        b=FXecwdpNch+PSGf331Q+p0Bn/xU+XZIT6nT9rOYMJ9/LFQUIf3j64jTjxGfIP1/AVH
         dglqsezvUvohx4dnD95zRE+9xvMO9vvV5NZX/lglR+zOppZHL7m6+cyPd1iM4BC0tHnu
         PxGNs00OXH6zvhjdfOIK7wFL8nQrlwK16mrbGguJtUrq5or9bscDF0K9oAXUzbcfOYMc
         DMTOwatCIwxDIh9RyaUI/tlxjrCB1HqkoKYO+vnA1b6S4DeBZcf2Wo+OJdzbM3ExFLgO
         SL/0Qv08Ob1hY/UcBTdRkvncWTvdhxM7fw/bahnBPM7vialYHlSNjyp8jWgNOLuyGYVu
         3SYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id l3si380047wmg.0.2019.09.19.07.11.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 07:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x8JEBG8t015648
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 19 Sep 2019 16:11:16 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8JEBFwh017288
	for <jailhouse-dev@googlegroups.com>; Thu, 19 Sep 2019 16:11:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: Fix qemu-x86 /wrt VGA access window
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <180104b9-95a8-3c54-211b-65d18da70d49@siemens.com>
Date: Thu, 19 Sep 2019 16:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Copy&paste mistake, other target were correctly set to a size of 0x30.

Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a permission bitmap")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/qemu-x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index f9877a21..03768f12 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -205,7 +205,7 @@ struct {
 		PIO_RANGE(0x70, 0x2), /* rtc */
 		PIO_RANGE(0x1ce, 0x3), /* vbe */
 		PIO_RANGE(0x2f8, 0x8), /* serial2 */
-		PIO_RANGE(0x3b0, 0x8), /* VGA */
+		PIO_RANGE(0x3b0, 0x30), /* VGA */
 		PIO_RANGE(0x3f0, 0x8), /* floppy */
 		PIO_RANGE(0x402, 0x1), /* invalid but accessed by X */
 		PIO_RANGE(0x5658, 0x4), /* vmport */
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/180104b9-95a8-3c54-211b-65d18da70d49%40siemens.com.
