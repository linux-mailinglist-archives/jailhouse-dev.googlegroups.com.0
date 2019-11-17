Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZW7YXXAKGQEY3VBU2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E486FFA99
	for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 17:05:59 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id f8sf9906467edm.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Nov 2019 08:05:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574006759; cv=pass;
        d=google.com; s=arc-20160816;
        b=oXiot05VM8dmv/Qg+kPYUGieiXiCb1ZR2uX28iqrgDFjUhrgyIK7c9SBR7iAnCc2eL
         xWYaWe4jAv6gWUAnigkURA/5Z7A+KH0Yrg2540qMBcFy3KCDQxHvHAevEibzbwpaDZzL
         0BfOErbuOiUMmVkaf9tJ8W96qJ5rtOCBwzwKhbyiuohOgF/26iLYBozL9UuxR81qTn3V
         uXLD0XaUAT6SwRrK5dfJYhd2wo6D3WGE1vjVBivBH1DL7vo50nYh2QVZywY0Z+TWhhnV
         T6ULnkDAgo4awa34NIUuXuvm2N2ptBEmT0TUuMeDlZD3A3eXDLZ4INYeThm7kLleMs6P
         KukA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=APMAuczXARtRegXByXmf/BmJ4KTbtIZVEXGf7d7GSrs=;
        b=ja4f07iFqdpxywhOfwL1gQtznWZTPZIe28lLrifxSkGP4mswtyvo67pErfL0FQx+tK
         qrfQZMIr5oHQQFrCGx2V/dUw9jp3uQw9faufpAeuYvfQADCk/3gyOKp1LKVKYq2I4sf9
         /h2D6kJyLasVE04jcxgEJr1qjlNq4dhLarIZcnv4NO2+N5LeWCUZaAP5XKhq88qaMp40
         HzEqx/BlZjNmSdFT3Svili0y3kPqtMarhRE/kWBa8dYNBWdxEAX5BJZUznCOXEqA64Uh
         XumSHpbzaAdV0wbvN0MVHFCOJPhfR6+PhRHMsUlmxH/B4ZlLHpZdv9uTVyxA2t1gAN0n
         gZxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rzn2UyZz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=APMAuczXARtRegXByXmf/BmJ4KTbtIZVEXGf7d7GSrs=;
        b=Zph3Dvbq0OnWLIf3YJqRAc6bWwzKFsaywYCesYT6I1aNq07lMqczRb1In3e1Klmzog
         484y0BHRPWfzpDEk3jHGZ6q1G5AJZ0BOHdS6pMuTN4nnH0CgHROdnCJR06ocos3nM8XZ
         kfPYbRChUx3tiXc4YILk0mM+ZmwU/nXYo36lb9jfM/0Ww1KYFrIqhJIReUaL9ZTqeayi
         7BOcnQ1dh3QJ4xi46uYavD+CsI1pA17bb3Y/U5/1JvDu1nQfUEnGs3LuzGgrnW6DpW5E
         +qgL7cIcNck2hClz6YpiJzjZvLfsUDnm8b2AmdfCw6vqBLQgo1ECAugW2JO3i60ZJDH4
         VsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=APMAuczXARtRegXByXmf/BmJ4KTbtIZVEXGf7d7GSrs=;
        b=Wy7hBr5cPELqpLX4fknQW2XpvQuHOxC7p2VoOV2ilO25+Qor0kojstCsRikvgo9njr
         puiPT3y08QeOY1vNHAaryHiFmJ5g0xQCz309aeghM8x7gErCYjgWdZmN/rjwYRabPYX8
         5uxJGazIl5DD8fsUQQnTQh5SrHzZeXnc1f7Jiy5pEdKNAIwbS8LmBD2bwWHFE3YNyog2
         YONbYZhiwTPzQYcn/RaPe2s66pJWkdNIGF4RUDvdCrdq+vvzChJ4h/MY902cThrEUYib
         lttlxKmcnmWThNHcAcP+tF2tDId8jzDO32QZkv5CL/py6KhkCw9L/o6fFWlkQeC/zT4c
         z38g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbyp+2Fw5ducNA7PhHa1+IKIvnT/G0jEivlUG78dmph2fBGajS
	4ZO77a0AQRiSf61foOlirFk=
X-Google-Smtp-Source: APXvYqz3IkPuYi5X52uf9LXIONWBGGnrll4n+RQsbhxLi/cHEIi4yvTq+uquNdoExtmR4zU7Onrdqg==
X-Received: by 2002:a17:906:4e83:: with SMTP id v3mr19471307eju.246.1574006758881;
        Sun, 17 Nov 2019 08:05:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:edc6:: with SMTP id sb6ls4544851ejb.1.gmail; Sun, 17
 Nov 2019 08:05:57 -0800 (PST)
X-Received: by 2002:a17:906:e88:: with SMTP id p8mr18931454ejf.15.1574006757863;
        Sun, 17 Nov 2019 08:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574006757; cv=none;
        d=google.com; s=arc-20160816;
        b=Bpv/7+98wiY29Ih94G7QU9SWAluov4qmGphBHQ8d3REDk6eDXQWFDqu6JdHrUJnybV
         szHYIWKYVUtc+xANsZa/AgLTFPFNp1R2TBNPIa6Mmz4SfLnmsblz/m6n8vRTCVbv356/
         1CTi4/SNTjibI84hzq+s8nYrvw/XqhV8sDvHJDluvJDn3QMUwYP7oc1/yEZQpRkqeM7w
         gITsDpuAxlvTwwDAenY0lFeZkk+u8kNhxWTaw5lg/GKwH2aY6nUyV9Pn8uQUH4AQWQoo
         MNowqTbHYnH9fAKSnag8QLohk9umA9Ab5aBDq77P+RT5grU0VyjBlrfyJpw3OsK9Z2NA
         2i+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=xKLyx5fKl0n30nLJVqmwupyVatZj3+sN71rE9kmIC90=;
        b=ldr9+2rfLM81UTfin5DiIW0DkxPm+3Yuy8rGtItodf6VbkoICFzp7gNGfbndVH+4Kg
         imIZq1M+ocdTQIGsJZdMPf1UoxeOkbT7PDKKMYR0X0GfoSvDDqaz5pOx+ozK3fEx8o0z
         zShU1bjRfYTE+0QBDwhzYou/n/RG79cVhrSZmT95QHrDH5iu6escy830N2kPA3OzBEmL
         leOxejlHo54RAmM2WO7qRLv7QX6ZIBo7NbiYNgfIOjhY9lcLmrR8UxSDFfRh29dcbf6Q
         flxPicYNUTlDNVLK20v+ccdXvKajZ0HJW6D66TCoIYGHqLRwNT8pUfN/EYVj9CeA70gT
         bPFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Rzn2UyZz;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id z18si981124edd.5.2019.11.17.08.05.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Nov 2019 08:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8Qtq-1hbo8N1Ltq-00vupq for
 <jailhouse-dev@googlegroups.com>; Sun, 17 Nov 2019 17:05:57 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: efifb: Fix 1024x768 mode
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <b13da2e9-fbd3-deb2-e117-74bb2e398393@web.de>
Date: Sun, 17 Nov 2019 17:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:vRmvZrz1YYPeOzIUX8FwrU1wHMrdpYjI72TaWKuVYLhZoNMlSsx
 tMUbOjPdRncIKxpf32+1lFEkJWDy36DyOctyEbDl0coBezpjnvC8rjR0oc9ygHanr8U+eGi
 da073y5PP0Ems0UFcQNMzjKQ2gsghbovHryR2NswaM1hhzpDtSZfHAxYMMdyU6diRiPDEmY
 X8bQdwVFnSR7hFCY26VxQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tDbmxNn7GtA=:GDn+wafy/V9LX0e9nHDrqI
 JA558IcNT8GncPt+ZUch+k8KagFoKIJDJUZI0pniHPlrI3AhqE7hZWhXHzca72AyvhzD5wMWv
 sQXgmdRISOohxHI08Ro7Xzq65n3PzMfNb7smFMfzd81gVfs1ohMlaN9o/3bXcb425aNA9bNRe
 o0dW47tLJg27bApMjbWJ/WFfO2rqaV9QI95LdrEZSEz77XZmttHLs6gRXKOW4c+fNl5j431mC
 DbmhsRRwvC24t3oWwx6M2ePV22qatz9QkfuQS4pjj97d2Y+JxW9kTx8+4p29FsvoXg5M8QWv5
 jYjirWARPleIhQVcU6sHdHwtopIPmSVeEf8Udeowsn+2gl2MgwBW27o5AS5xxiCZMw+AFqiV9
 9hSjyjy8ZjW/0MmTrgXhI1UOVShvw6oVOuyjKRd7CYZzzKzX+hRWpNB3JMVL7ZP4wQH6rFHiP
 GyZNCm3mhpVzZJVN/8K+RK7IFDqIPQvgJMhmHw0fj+y7q33a04p0H5+tOZhcDx/T9U1IkODNB
 QLMeZA32vzZ+Qbl3PVlpg0+sVsNUA2Wkzv2QSTFhnNI8drtXVaXmAGw4ZfJid+QKyJ0ELGzuY
 ckzoWveAKZGyBBx1M0nbHZg5CDPd7bNtT8TcUEzr9021/K3vYeqdCHLnlFsxsli1APGBQH9gs
 C5gZlcE3+Mdl/cUfU5OBiZNHDro/89rluTlB3Zr7UzZ3xLwj6OUgobUmG+4497dhMv9mANgD0
 6KnOoM3c/RLk7nIURnfQeroKYP0VbWvvoTQTGaQAOwAP7tUMR7P3oN2UFCUXnHAoWboZrxS21
 niM4TzBaS/kRvzhxqKG6dA7TG/XdkRrzXj9qZEGSMwM9mO/1yQUSXdE1iTZbF5OXKXS+itoA7
 3JlpNMKF+2uI31BGc7ikt/RQFEjsXPOSCABDGTGcgM0yJNrhqwp31/PSjxhIl3xOiPEcp+shQ
 ab0YPYDgZPWmPM3UhvwGLrCv4ID8E/NTazorVMMZTLM5Egvo6q8DZVLjh48c5ZnkRIPwYiuvg
 tV7c5t1+7e4F00KDsBOlPgmszNZvd1eB2CKuffK/2uamjL5UisVHF0Atsw/aGUU7l2l9xdtnU
 5UpgxJ3RXi7/227LSEOksElL5xMoLUiLMgfwHPfh7y2gXHE8lJFs0Ql+A44QW4q1Kjm1LcYAG
 o5A8fkqAYIHXZRbyV4tQv7EMlGAZCb9Pwco2yfGFtydJ4agb/Izp6nxN6cEDIyiA3J5qaZS4M
 8E5HwhNw/0hov5ZuJZz6YW6psIuvhMn9P5PywTynH/Pvtbg0BFogPCw+HpXk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Rzn2UyZz;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Exactly, it's *768*. This digit flip broke scrolling at best or even
hang the box when the framebuffer mapping was sized as needed.

Fixes: 790ac72a3ee5 ("x86: Add EFI framebuffer debug console")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/efifb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/efifb.c b/hypervisor/arch/x86/efifb.c
index f7d4d68c..372cf790 100644
--- a/hypervisor/arch/x86/efifb.c
+++ b/hypervisor/arch/x86/efifb.c
@@ -111,6 +111,6 @@ void efifb_init(void)
 		efifb_height = 1080 / EFIFB_FONT_HEIGHT;
 	} else {
 		efifb_width  = 1024 / EFIFB_FONT_WIDTH;
-		efifb_height =  876 / EFIFB_FONT_HEIGHT;
+		efifb_height =  768 / EFIFB_FONT_HEIGHT;
 	}
 }
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b13da2e9-fbd3-deb2-e117-74bb2e398393%40web.de.
