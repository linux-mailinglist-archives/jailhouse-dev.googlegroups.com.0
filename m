Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB76V275QKGQEO3OOG4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 93680280180
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Oct 2020 16:43:12 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 1sf1911185lfq.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Oct 2020 07:43:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601563392; cv=pass;
        d=google.com; s=arc-20160816;
        b=0gYJcaS7P5GwICaLY/Laeyz5WL83udE559KL3DK2oREleB5PjRk8Nlxcl8YLaM4mpz
         Z0cQGikkhE9k5p2xocboyapzYG0fL/bdWMnQlBHDRsL3FRZ1AfWLcCYGd68MnFbJcPOp
         BNPbGCNTIhSW0g7y/Lw4Ypd5exw7JcW7z2BfKOZcV3eNONBHftfxLh+t1RFWNkR9ck1F
         mvx+pTIXLX30kgYegQl/v4D9XsYJZBlmastkEojKdxqP7H5raVTdAa6PgC8EiK3f9dhh
         G0oLRthq3lvHIAi5OyY9vqF7Nniaa5FICrh0WzTCRXMFJdO2qilycpR/PUXmZp0ynIFy
         fWtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=X+BUPRkssdZQkhXj+2dz26C9OYqqyr/rAwgyY0UE0j4=;
        b=KegMfgiRWMwS8M6xpgfq7oHNR8AlJGlzPt8Uz8gO2ZyyFb6oxT0ZKZn7Y6uQy2uCqf
         puo76WZh4KEcYxUCiYMv/ANfod62OxXw9hvT7Uynp+Ydf5HLa/Ktq8nm7qT+BfYsjhMi
         dCMB4kwCkwUZKQtyolaG39BATdS5y7X+s3KtoR/6XqbGRw1lsOp2c8v5NDEKUYA7n+1z
         jU085r9uSIBMfzJIcb5nuqDxBDD5yxz0UYmsO5VSGXhp1mCJyglSh87qYmi7EoOK2IIs
         tYbsmZJHwU1TuvLp42kGrac5rulVSTkW3BO/4ufbTOAzMW8F79fwQyl15SegK3TKYEE+
         eCHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kM1H1Y1F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X+BUPRkssdZQkhXj+2dz26C9OYqqyr/rAwgyY0UE0j4=;
        b=Sb99Mxa4ZAf7TSnW9uMMc+iHlQvBwjM9k0gfHiyODGwDCO5DO4qaGDip/UFwbcOIzg
         MtiYJWecoeECX983aJdiHbDJffiUbM3eh61RX3AWVQ54Yq4Cg3YYXXn9TdBVLlktRLIJ
         QhV8C3ufSR2s32YjlHTpqCx992axgk7n9r4R8d9T/NSK90Kb8fSdTjoCydvrdwBiFrCn
         V8LRGZdp079N90kv4cxxnDxnWQdjW1AHc7q59ZrEu94S9aLra/bY4t7rxKs1qb7oTyt6
         Z4OHFLGyqq3rH+YVT2oV3hb+XJ2hOS6QnJEJ0gIkoV3TPJwvXV6EBXAWv+1G/3aRaSgR
         aqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X+BUPRkssdZQkhXj+2dz26C9OYqqyr/rAwgyY0UE0j4=;
        b=iJZj/LUsFlmAOW+8uWGPHHOJWNMo2Wt/83SZ3kyKgP4WJjIohefls9EQE+5Dt3MIEr
         6dpvPzdtSWVHFZEzsh3Z42jGBN/d7nMGi3CGJGTFc0Omq+tSKkrgPJI+oV5yK8zrw+DZ
         KN9Ih0mN3ihycnWAmHdj7L/Hu1o5rXEf68toGmRYTX0VRGSFh+M/5a0uTUfkQxdX6hYJ
         mlKC8VHAdyHNA/h8KCGnsG46eBXcHz/hXlKQNByAvpVL58xvMKVoIe/WLgB695Nu+gtE
         5Q8zxf93OHWOozTqhXyCKSXWyRBiQGRz8//VAc0Czxw81xlWSnlSTWkTJUHIN/es/Oc4
         3Ztg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338zgB4SqjyrxNjLFH3s6/y64PIfDp8ikGCEDo3up8+vlXsNLC2
	fYIMr7D9XEoKCWO4KgkPPpg=
X-Google-Smtp-Source: ABdhPJzNk48gULWaTuKKa7ERFpkdMLIoTKuZ7fnWrg2UKTPAV/D7IsZpmns7yFBCdIxlzF7a8VLnfw==
X-Received: by 2002:a05:651c:1188:: with SMTP id w8mr2698532ljo.344.1601563391946;
        Thu, 01 Oct 2020 07:43:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bc6:: with SMTP id w6ls886701ljj.0.gmail; Thu, 01 Oct
 2020 07:43:10 -0700 (PDT)
X-Received: by 2002:a2e:7c09:: with SMTP id x9mr2263626ljc.192.1601563390745;
        Thu, 01 Oct 2020 07:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601563390; cv=none;
        d=google.com; s=arc-20160816;
        b=vuggIw0ErcfeAV3Sj3TU45bwKTG1x95TxQRwDXlBX07DHxhW/MnbYnl+t+AJSOyreC
         C7l/pfVisYryUhw6yDPRWCE8Rw0Rwm+IBPOpnfZrO+etAASVK9aXk36M/ZGjxKWv8o3N
         hJ4jba6YoyLW8mZSttRxGUMErQwA1dfW23pmtfoOAH+VpanaCVAXVR8K/htCt3gwjE2a
         w+pxO8ORLsUjQN6Q6tqdbUIyHuRxMqxw7LDwc2ROcXbNjjW1b0nSqvr+JLCt0HGqP+IL
         KcwK/B/LHUFE+7ALJucczb0IRNeS9aisgFMPrGxRvlaIEZwCwqkUZZjw10QOG3z+dL4L
         sfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=AxGCiVZOPeYAv+WOwrVJl1ob0JVCY+zbplpFGm1GhrU=;
        b=xahEUmsHcQDHrv2LODIm5KmQ+QvaC9lhOqEFFwFn17ezeny2vyy6OPEr8USr1eBOMg
         9gkfO1QxtZH6639b/nhdDeB/C6XpH+2cavP2qNeTBz4agG09Uh/QY7rW6H7Jjyy1pBx2
         0MwmFPa3/+0/McJb9djl4wbwyVU0E6Zf1EMR/ibnJZu815KDMgwokZgeym6w4jSvSfmY
         MVeIZ83CUa4Xdg4u1Tb+TI9QP2FSMzlj0CGPGnNRa+Mn5Z/9Ask7D9aLgfjwm4y+D9SP
         HThoWU97OZuyJxQUbCkq+9Rwxmvb6srAVi8ZxMSUq5cm7t4WhtjtSgU15KVPPcKjpY5e
         elXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=kM1H1Y1F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id x74si145884lff.12.2020.10.01.07.43.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 07:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ux4-1kKA2h3gtm-0057TM for
 <jailhouse-dev@googlegroups.com>; Thu, 01 Oct 2020 16:43:09 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] pyjailhouse: Do not fail on missing date for DebugConsole
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <ffe5a2f9-3587-42c5-a0bc-6c428719dd73@web.de>
Date: Thu, 1 Oct 2020 16:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:VcqKTg7xL9phsvQmALI6cn0NcesTbQj+Dkt6ZdUlebdze3juCYr
 cbRnbttgrpVBCfa2B278D20AwtKO+ZsJ15AiIIB2/qV/XfyJUTkn05efQ5vH5vzxTOXYMLK
 106Xp8HLK75yaXKljDFdZ5+UmtF7Y5IOfcdXe0O8mmL8MVjeh01Turlft2yKoYxkTLeYcj5
 wHeF/ce5qrFhtaAS0AUVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WnWxJAkUD60=:GXxsMnsTLpCsjeeuCNCMd4
 TBbrUh9hKsQGZ/EdO2Lm3E4Zuym+CtICYvhKwEbCqSK8zjhttEs4EKmfu5A2EnJYU3biTZM2h
 /x8gcJBvHhI+5F3PB1R+fOCxjHlhosI24+woweLpM7TYIsKDotAl8zJLvgN/THt7YrVOwqJaJ
 1rKWTQonjDG7fr91y4lhAu17MJ3nM9EBqDfa4orDokwsPNPAj6S85B7H+q7W30ouVAOXTune0
 ERYSNtt9T0Q721cBEQFx6f1d+FAckvg8ybsIi1uTQtKXYfRmrpazytoG/66E5xtxbfTR8AZFO
 8VXM4HIzX8nWqt8DZS4YrOcTGxEXw5mXBsDUNqZ+NHl+5eZzttB3ZhIX8Ke/p+CcVddvJ1lgU
 EmgM/pTHQdgTV5R4f4gK3QBjse3CHB7VY2ehnTgOOZ1HxFNVSrY1DSB3gSaQbMlpUccZ3x3J9
 qJfhm6u80t2S7QOLyeZd//hxDzNTYP1WPj1JT0LdMWUWcW4zLGy6JaKuI133/x+HC7QZPfBYX
 GUx7xeNYNtim3Op1wPH4FFeihTxfKOb7Q/+sGq6gxU+0kLctOb6F9XWxF031wzVmx5k+8UXfB
 VpDCWn/qqNqJktRI2Mg9+TAoTyXS5TyBUw+LLRmfTKWlHP7aBNxvfAUxk25bJ/N3gvYZEfODx
 7z5RGoegmZs/QJvwFUA8or+IdqPiO8zGzisml+JGuu8BXeLtqxcp2K3kicNUB0ijOld8sX6j0
 80NQiSN4lOundfAY9Lj3krLFru2UeUYCx6OUx9EaE9ajg1FdiV/Dw00E6+jekaqirvo6BwErD
 5FXzPOKqWi4b/jSuqMceMtQQAuETzx0iRFmSZ38Pm7MiqUr0BlWn/Oa41EKLzlHV1JzHBOhYy
 zSP2weeL2sSimKDomGDh6UqC7sgE0w1JJYH1ML2tigE3RQHSrLF64ki6Ktg8DkvUqWygSqCFg
 heVfCbJ6FnWYgpTGMqUsdOwWzii8EpTkgrRCBUeQE4LRC3MlkZ6/qXXivDDVP9NLtYZY6n0nO
 Ght9ZMqASQbOjbHiW9nO5tSOR1Iar12feRPMoLVwoHyJrMl9zFzx0Qyimm8gq3W9jYnKgsgpw
 KJQXk+guhu9MeqtCbAO/UjL4mWBcX56AC2C8wt72k+ezdIqyzqTHVoqc7waz48+I3x4bta6NZ
 cv8sAU/ijdu+tZzbeqQsdHEj5NDmCii9dt0tn6BeJiSal+FkonArOY+C0HW6nnTjXAldRb0If
 Fo85Uvik/rOkp/uUUgaTHaEYLoGyzJIwPBIt2bg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=kM1H1Y1F;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

All readouts are optional, but then they will return empty strings.
Converting them to integer will raise ValueError. Catch that and ignore
it - we won't have DebugConsole information then, as desired.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-config-create | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 0f75be4f..3005c2e7 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -191,7 +191,9 @@ class DebugConsole:
         self.address = 0
         self.pio = False
         self.dist1 = False
-        if console != 'none':
+        if console == 'none':
+            return
+        try:
             type = int(input_readline('/sys/class/tty/%s/io_type' % console,
                                       True))
             if type == 0:
@@ -211,6 +213,8 @@ class DebugConsole:
                         '/sys/class/tty/%s/iomem_base' % console, True), 16)
                     self.pio = False
                     self.dist1 = (shift == 0)
+        except ValueError:
+            pass


 if options.generate_collector:
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ffe5a2f9-3587-42c5-a0bc-6c428719dd73%40web.de.
