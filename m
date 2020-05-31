Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJEKZ73AKGQE63IQKRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 505191E9844
	for <lists+jailhouse-dev@lfdr.de>; Sun, 31 May 2020 16:54:29 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id w4sf3541424wrl.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 May 2020 07:54:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590936869; cv=pass;
        d=google.com; s=arc-20160816;
        b=ihwEKlhw9SLUgG1srGmD2PWDFLNnSwtPODtpiofcyjtjzuxRGow4PP37/Hs5PbhGx1
         xJfBPRcrOFeLG1qCDNvFqsvJRXrcwtFehr83646kazj+Ml6lR5Fy6vltC67dICmLbsHk
         UB4o/Yq9RURpNIJ71fWI0OEIrCfgAw+4bKnJ51AR85xoAApwRhlV2gbXR2eV6MHNo2k2
         BHa/t2RttxzHyGJBoQ+kUf+DW9Iab2azFXd27/+mbUi3QbgNDSynl56xTn3zsbX88sKl
         2d/NXRj1nmggHMAGLXxRa/2xd3qz9QUhCuVNfq0hdC8S55shor5O6Y63ujiu70fjA5wL
         K0iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=DzHL04rXGQgDzKr9NQMi2Thm0LCy6ZU9mmnymMxKAIk=;
        b=S2xjZqlnB/NpUAipv2A151F1Wpiku9m8b/oz4VHeiZpPQDFU7Cyt9umb+V5WqBQeLL
         bN2pwWlXDZ0oW7WORyHHKXTIn4qoik7BpqacQDAAk+gKuMUkX/vuhUwwuPypIT0+1HRK
         tX4zgpssCE173ktJbhFehY7W8BDgnjGhc153tWq6pJ/wwjeXqUR5kfGgYzhJx+bhbsSy
         E+01HYBFKB0JHPbaamX3PGHPrz65+YjMKB5dPk15dGlvgDQygWJr5DKHNARA7Z9rF7Jr
         U8XbpLGBudJWQoJ+lIhEYJPs5svPwKnl+riSdNYdxSsBgiin0Yf+gUhNcFdxBqKLzR6N
         4GEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hAMcYH0F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DzHL04rXGQgDzKr9NQMi2Thm0LCy6ZU9mmnymMxKAIk=;
        b=qbU14RjEwqRvFnZNpCndnE6fVqQyjLhu1E8oX3jQRljdbK70IKaWGMJXQph8fQ8JA/
         zvz1GtKNsZXQ/lK26mRluOiN2Ovsqdp482hydGXl4ve/c3ABrOMDI1ieJZptzvmanP25
         Fyxymc6dVqm3STBie+I+E3M3dVTatoSHQfsziK42lTSZFi7woeOXk2RSfxTnY9CJQ8rJ
         TfOMpg2PnEifJpvVMzAbdV42FdwJ+VV/ZVBltxbI14aKqHHZw2hGFtACli66Jh7OMYtK
         +rGvebLW0+hTyLEnsQjWPZxp6kalIxG7exCos5oAkpkpoc4wS0r6gcC/A3Q38rI+tJJD
         8axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DzHL04rXGQgDzKr9NQMi2Thm0LCy6ZU9mmnymMxKAIk=;
        b=nDoPQN2WJlY1u7DwNj3SRvg5rQnVFjOCG7W+9uQt5G0dVXj5L4kAYBU7M4Nq0uRyFq
         09hgFxmjNJqLcxJNBK2+6QXmJo/88Sm3oJc03p1BqJlZ3R/7DTSItnDMhJhw+eLE2scv
         3tpaZHk5poX+5B/8Y7rmmSqZWW/siwx/OTyjE5c1uqKp0jrtqaqV4hwwlhNyfp5SPSGl
         emlyEfAhZc4rnmOVpGjQjyM8zFkvMSL+pzXJECI7oKgRxnhKrzhtfAUt201CqOo0s43c
         L/64a+GvNtBUVuIr4hY3D+B/z2fXwytgUnwYxpXVT1DE87dJoiP89KRX/Aa6itipjARh
         xtuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533zlbwD2RqU4t2ER0oVQiYFamJ1nJZP7JaDTpA5sRnZpVlRNYEq
	TgL6GipZiyyG3YgHdpuHApk=
X-Google-Smtp-Source: ABdhPJy6OMqGdXTQJx31oe3YV87eBVoWSJN2mAU4nqhc5wTOJI4RqcZ4Qc23G4czcvtb+5s/sW1xNg==
X-Received: by 2002:a05:600c:2259:: with SMTP id a25mr12438808wmm.32.1590936869058;
        Sun, 31 May 2020 07:54:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls9905851wrl.3.gmail; Sun, 31 May
 2020 07:54:28 -0700 (PDT)
X-Received: by 2002:a5d:4404:: with SMTP id z4mr17227749wrq.189.1590936868526;
        Sun, 31 May 2020 07:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590936868; cv=none;
        d=google.com; s=arc-20160816;
        b=x8STZrcbztZjXkI+eh3b+Weu2cuMtg0mDp4GfBjZ49pRLrAE241rkdLEUXtFfpXnmw
         4f94Ho4c6QDHSDqk7xS/YAdRPE3blVK7oUltqqAcY6BdpnAv+g3EeqU4vEIzHleJanK9
         VGdyhuvfbk9e8q+XCNs12OjPGF0YSh11d26NTxFDI6rL5BROmWiz7770wkU5Uy4/ajrJ
         CshrvV/QX3c68hDVhEPUMJqjzI4ALMRRVD6++N2BbF7jSbTnMYepiWQY2uL4PcLOsVLh
         BpBBVXgkQGgmf3EzeqXS9W7sWrUOFRnBIZ0aSW9AIELeiHpdryYXpkEEoa2RL8g32fwO
         kfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=M/38zpxfk6B48fDHL+L/WSjHXjvSG3ZtDoB2h8mFs+w=;
        b=pbV7KBaCyYwGg39pUEsOZIONBPjHOxGTOA58kD0gjM+6IkUe7KHOw6GaPdbDwsVftt
         jWwtdkT32FOCCKzn9ECI7B/zcEwAVIyaGonQpxdZ7OnNP9JsaD7GotItSMGfYAYepOEH
         /QKrw6Sn8zB8K9d/rO+bK+hSg4fw6Wf8psTtHKbxdS2tO6jR/l0gFkodHdcO697QjvMU
         /ZpJ1blK5z5QnJt03N6SlMw8YjM7BrjScHM6aD1iRk7qn5nzDqHqGuLgl6SrFG2KSwZ/
         h+O9namdMhxYNj+oMA8yDjKmkGVECzwt0eG3VB5d5WQlvfXsHRjZNCsBNCeyqRFqydV6
         vvjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hAMcYH0F;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id y71si255466wmd.3.2020.05.31.07.54.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 07:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QqN-1jgEAY1xwL-001UJy; Sun, 31
 May 2020 16:54:27 +0200
Subject: Re: Jailhouse recipe
To: Parth Dode <dodecoder@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <68d7b86a-5fa2-4582-9f53-809c0fc3e760@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <89d9494f-2d7b-b3a1-4629-6e3f7990477c@web.de>
Date: Sun, 31 May 2020 16:54:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <68d7b86a-5fa2-4582-9f53-809c0fc3e760@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:7hUxPZI/Q4DLnLWK/p4+tTpLBS6XjVuzs9GwVRh7FAa+ETHITHS
 KnyNjiUtXNF4M7KyqQAV5mAS+HtBLK6ocDyLEWy5fVb0gmqT310hW6Q2dk3wYjujql/DNfk
 vQ98i3MIGVypHXA2OFcv6ug3G6zequbW6QeThj3FVdvfqV1S1UnqWRvmVl9UjElbT7IOTAd
 JadO218Cm+pD3n/i7LE4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xUAdVJJ9P0Q=:XhvWlenaBYRTfjotWA4bOi
 ujuf4xXw/gNoN93wvPpLPponefzjatAzGQBj6R9maV0V/TjcEPJ5rCCjP/nQxxrGxrtwSrm54
 es9Aj4xEvWtuAVD1XJp+uSdidoMpnzuoueyV5ISFWYqdE2zxZFUdkpdVuaPE6pcIdNx1piRSW
 /QAf6jQOCj+CRqFCilURiW0g4tbuqz6VvehJP7+OSIFrg8LhAQsv6bGHTam7slgZ9dTSJrPMQ
 S/51zxQpdsRcjZxS8oOOg9U+HG5hzFPerecWs6cGSC9GYKezeGpP1/vz3PwoNnuxcOCIYJU8X
 UVdHKVmvjn14REiY9MN2AqUo00tFWzcFUr+5RxYqiLbq/S6hkygq1DCqQFaFeHUQIuyOsZL/O
 zhMZ3Cl9xITn1afEpH3Eoq+aEgqJ/yL2Nvci4HGvYx/+HNyKBMHJ3ddSfbkOp+Yqfy9piF0OS
 KmVCmd9GyA7Ma22jJE/R/y79nlMn8ZLacyEf+Hmj2OJ7fTUFE7Efh3BFj+sT1LUOyCrSzBo6U
 5yuqZj06LkF2WHugezAaQyqqvRvDKX3h5+ye6GBul9nycYEzsuKYMSxaHUnmRX6EMdKExD8ci
 k/U4ilagvCCRLX1OHP2oHvfujTrH2cIt1nC1Dy3I2PTyFTvqxrwrmTFc6OwBVeZteb/unDulS
 rmM/zpKDiFx4ycR3pnHCxpQvUknw6cWP8CDi+LjZ0e1ltHM0upayukheKLDGuU1wX2SyMdwYB
 t86hZcANRkMhPgtRcx2tg2AE/emKUey99eJKTc7fuCp17bwp3rFDUQbN/eXj3t0mksSAM/GQ/
 5lUDS6DZERzKE9VVfuiF4twL6SRrjuUc6H5qVEF577dPyEYSFGYIRaLqwtSqGvgxj3wJOFFoy
 VoxDJhmIOiZjo6RU/J6Lsnb2+2he6HveHQBGk2Ujinj+7RE6lY0tljN+u5yyooQl1JGNbLy1b
 jnLFdtrkaLvXYcGoD+ZIvYDamfr28NUYD/zf2lKmv0LLMIh6CUvgQeCv0cQSXgS47PqXW2EKE
 AdfWX4Wa2yiFjA86Mw94Lm4X8J2OsjO4nQc9iN2uRifiKqie4k22fONAi41tM8PAJ0W0bRR4+
 Nkm6I+LzSB6RxEu66hP1zk6eAMDip91KVNNiADaTuvcjCCWDY4nj+TXI5ip+UKOfsaIMuJfwu
 EHKWS4OkB4/K73LSofymJ6vUchwsjkOEwp3PaVr26MhXuQfzpoX+TX6op34+3yeDV9wjye3ZG
 ugHIqLeyJPXN7cX5J
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=hAMcYH0F;       spf=pass
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

On 31.05.20 16:09, Parth Dode wrote:
> So I am trying to build OS for rpi4 using yocto.
> I am not going for debian system so im not gonna use Isar.
> How do I configure jailhouse in this ?what are the recipe and configs , I need to keep?
>

The cell configs for the rpi4 are part for the Jailhouse repo. What
jailhouse-images provide in addition:

 - selection of RPi kernel tree with all needed patches for Jailhouse
 - kernel reference config
 - integration of ATF (2.2 required a patch, 2.3+ would be be patchless)
   into RPi4 boot process (required in order to have PSCI for CPU
   hotplug under Linux)

The rest of the image is more or less convenience.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/89d9494f-2d7b-b3a1-4629-6e3f7990477c%40web.de.
