Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 169562E988C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id j14sf6247469lfu.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774206; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wbm4DEje2VRazrUUcKKsRRA7lBL3a6a9PXw6cHuW2tl0+j02RCFmvT1R/QtZHIGRJs
         mP4cr/AVUVTpgVaV91kyKlLDskRM9P6wL2FCXgJ51fhER7gf3VvTFuf6P7SaKpFW+duU
         rPJ5r3UgH+VyzUBox3jo1Q6u/Z6nWwbfMPz8xTygRVQdGXh79LjOaq1cimew67Ry04ey
         kOE09xDLMc5Uy0teAm5aqCwsLazB9GKYj51Aqftog2JB09n8A/d6jbx5bzdaLI0z0dgI
         daqU//bTMoJmpkTWcR9Xbvhzn0+wpU+vc9RyWitadj4E/+ixXUTidMHDzcoUwWf6t75S
         vWcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=59okfIAM/9+cSKi2wQobPS6b5WCB/0xR5GqUQiCzmiI=;
        b=yl4DFE/ZgTv04VRDNRRY1FFjnUqLwW6apzJkRT5pVYPN1t+rHS29Ya2f3UpUsOJBoZ
         hsrrHTYcbPIvHkqIJKWlAZmzHZWa3/FXg+k1kWgY9xDIOKsl/RqVHdqj/d+JbTr5LSZs
         luTySkjCQsOg/aLDo+GrD3WzflZ2ws3mbqPo1La+oFF8twyDNOmqIORY8k4CTxSQOZY7
         Q1eFGrkl3ivb2wQnDhC+C5TSS2yyTN4EG4TJojQFPBU7bF74ND92gfmFJSpK0DQfP3rP
         OLoF0TSdFedqHcqpPmKakrsY3LStUBMy8nKDMCLpMk7dj5ZS4IatZzNOxL/4CF5YCGGa
         SjNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aQVxenHP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=59okfIAM/9+cSKi2wQobPS6b5WCB/0xR5GqUQiCzmiI=;
        b=UH+PMO14dVxICq5dyRGJtCZP28sGQIzdI+6v14ctLOIOUl5D81H8zGwiJPfLW5xoez
         oU74j1Cn0XSQv44NGzXhrPMErD1UZlH4asBsMGsuVyFPMry2H33MDVZeIJfTwkEdk6cA
         pLinpswyd2ykHQ3FRL96qpCXHRB8NaPsfrZwN4rcNEx8XLg1Dj+5Aal30e3CHlDtZWzy
         aN1pYT8fKAcRHKmePRihWHEfIEwLXRoDlTf9nj49b6BewieTakTt0vALbFnMyP67JSUi
         eC8xRMxG7AkiqDX9lZvdME/DLWvhIKuvj1cB/YTQd7tIJgtf9IB6dVC+YznTQquGKm0X
         Qx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=59okfIAM/9+cSKi2wQobPS6b5WCB/0xR5GqUQiCzmiI=;
        b=BQrAO6hoV1KIMqCSElytitWVdg0JKYHMZo3xC3siVwnG7s00Awn8ui+aElN7v0njWW
         4Z0Ed4mIiiypgdLw+bTWuqlFTgy92OOCjQ+jRi56r1NE82MadvN5eRyvrt5Tw39McITg
         wQjcXmJacIocqCsHvVbdJ0fpPstegYaqETwm9Mdl5S0PpWVEF+Dplu2+B0bmE0TBB6AC
         BO0UPndgD662e5VFOA3OoLkg++cZowqqgJvr4xwLgl6kkQkU4Mmyaq446CWbnHWH6S1v
         tD1qxfJj6S0uhGiOC3luYgDVrj0Qvb5sYZPlmGQqpFZWz5fJwdEVElpKmGLtw4Mbu5JG
         uB/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Laobo9SR+L+MT3RAZew0n7AB0MuqgXonRuOm3Sdo0qm1hPNoh
	rrCZxV7I7/mCkpQxWNprRCs=
X-Google-Smtp-Source: ABdhPJwRILLlSy0bUrRL/SBX9a2TZnmDt8TxNWkoy+/pJDuJVllBniwPU7klsBKUlYG+LcfLTnW26Q==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr30789623lfa.322.1609774206643;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b549:: with SMTP id a9ls12098626ljn.1.gmail; Mon, 04 Jan
 2021 07:30:05 -0800 (PST)
X-Received: by 2002:a2e:b00c:: with SMTP id y12mr34574475ljk.85.1609774205444;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx+SCEVQ1UB+99gKIDsipfxuWYj2L/N5AqSkkvkLmB4pUGBqLRYEiJSYFYQAFuiiDB
         TzMBakL/shrs9eNJS5Rb3BQRkmtDiItsu4aJTYswynuFI0Mo9gHeY82GsIbV0kpH3D+8
         vvCawY3Xp7TanuwkJZ15PpKaI3ZtG4/3KNPqITQ4vuPi7+0T5LvG3sn1BrH0XVtddLV1
         Wwv2OJOu7pB6Y0G25tzvvs0WawQR7QLU80Zx1OgT1rK2wVEh9IGqE+BaFqI3I+EIJsmd
         kTn1Rc99w7flmyVa4kaOvruK8BoticBQ98Px8o5QSFGgl8whX80Wk04YS1VQNFjCUBsY
         VwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=379sOCiSyLmwhH/J2FXq40TBIvanT9XtZRbHlzTPoEQ=;
        b=u6gomjjj3qJQf264x0PnMs/NdYTZGjnMyy34qpfOsa5LVYOIsTJuJ7uiZY9wFVu/a/
         N8X29dABizugyVP02G5YiSL7tTIwIbokwxuHdfmoBEum7EPOkibnWhymB5Plx3ADJbVE
         wHC/DFTw+z/h5IvvDYCs42AFp1AN9DZN9qswh/WdgpX96UxmJ80IpKdQ5LY9ymsqTyRZ
         7caoGiVLT2w4B4PlvAL8yPnH9auCG7xeDQkdYGzk5ZJS/W2hFpQy/Q7mafDbconiMXxZ
         tBKWZBM1UZ/rfG3O77B7AlauW5t0zUnf38EK1LgZrgXFquZF9U9gQzAtwjVBF0Miym02
         V4cQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aQVxenHP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id z4si1431928lfr.7.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1Mrfp8-1kBETY2rGG-00ncVs for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:04 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 2/9] arm: entry: Drop broken attempt to restore CPSR
Date: Mon,  4 Jan 2021 16:29:52 +0100
Message-Id: <5a9b08b44fd429feb90abcaa4fe01b1867f66225.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LTMcYBk+tWz5T2dP7B4FLbaLzjqP8x+9wD87W89XmXBdhRMH0VC
 15ANIumFfR7aJthMY4bzub0d3xMwNZ53zQyn4ADvG7IaVw6yf5RS21zP4JcSDxxQ7UKVV1x
 Rxdc0b1RkDY9XxixltlVap/3zDpuUn4Z0DeJ5HArXi47kMaNwZXCUHTBI4Y5oS5n6BcmK6o
 t65pLW9k65W5koq7YOgBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p8KP8nnFfA4=:6dcDJ6glJ4017BWi/ke8mH
 2s2zvDUTQ7aIep555kROP1KLT/Ihfo1nXQReV76vNGuWUov5c8zDnUxrvwDob10sPj4hxrSoA
 ri5EWpk/qpnhsKmtekjBdxq073JCcMG4bEdc1d7bGaZmzDN807FwR7MTSML9dJT+1mvV+aqvn
 HK3avh2DfrpyEi5IUWlk4YQ/LzZVfd5Alz29E5oya1b7/x1r2L34Q/x7qUuwX+RUvhi1QknEq
 CUke3L6dhl9RK+g3wmqXS480FynO4zoFQH8SkfCUFeig3vllmDblqoBTXiK9rVxSRuE2s122N
 dKYwCY6cu+2QiuvbfLOubtb7aaBThkkjOqAeClirfKVmabqwd2aOjjhhfDHm7f7sladUGVDJ4
 uX22THAClA/sfflSlSzgf7JsdhitlGxW/4wSuvm4UMwyRdKZc2iHEQEMXx6dxVZJoU/ZTSNeQ
 4ZUjfCfJdtfuHU9i/D9qIibf59VERVPCzNDx01xkDQkZ1dQGLjA3bGf/Vcuuz7FBT8jHz5Pnz
 s0dlkBIuRpDzv5peHSTLbMbaU98aiLYePvlEQBomf/HTAZSrR45qxVCzZ1REG97g6JGWFvnye
 MKJf0AMoejTn+SSy6Wns0izNt5hUZsCO5AiiQswHJa+6ZG5+rKfGmCQGg0IMnfH9TSM+LAddY
 VA1FS/IoHY78SENnLMXbjsSfQvvnTadioh2yeHsn+AKXBQVGFxEpZj6hzrg6eW2fVdNqvOBvw
 eofcUaNuqIgOsj3MTV+vQ8vxKfEkuddVASIGlpTJh5Bd9bBQIVrXOzNiUnLnuYAPZeOKdBPqJ
 XdtI/P0+an6wast/XYCMZVh95rQZNTGaHKAxdJ+ZfXT74AaYfe5A8/b5Yc1YYPx9JYNIt6B08
 U8MZfE1niE4M7dn2dSSw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=aQVxenHP;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This is neither the proper way to restor CPSR (we do not return to Linux
on error via eret) nor is this needed (no relevant change to CPSR done
if we return prior to switching to EL2). So drop this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/entry.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hypervisor/arch/arm/entry.S b/hypervisor/arch/arm/entry.S
index 1425e0b6..814772ca 100644
--- a/hypervisor/arch/arm/entry.S
+++ b/hypervisor/arch/arm/entry.S
@@ -55,8 +55,6 @@ arch_entry:
 	/*
 	 * entry only returns here when there is an error before setting up EL2
 	 */
-	ldr	r3, [r4], #-4
-	msr	spsr, r3
 	ldr	lr, [r4], #-4
 	ldr	sp, [r4]

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a9b08b44fd429feb90abcaa4fe01b1867f66225.1609774199.git.jan.kiszka%40web.de.
