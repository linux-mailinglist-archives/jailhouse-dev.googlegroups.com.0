Return-Path: <jailhouse-dev+bncBCE6JKFIVQARBCUMRX3QKGQE6RXPOYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DE1F75B3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 11:08:27 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id p82sf3979819oia.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SkQkwwT1BYuhQbIUI6D5z390ZTBkLaXDUUGtWqBIXfg=;
        b=khmdbpi1P1jkR5AUJPxxpbQARVznHalEgkKsbHWWPOIdrIDxtqOaX40PASbJKrmTm+
         g8iTMeJzpGyi5TsFrUIaMxcE9PTHbizLKKK0rg1sfIm9oZiVee67ZT7WJ3U/rK4ebFSW
         w8Y0VHA3ZBa5WFysfkalPt5SNYIwLEinFMrHAqPfghYXG2QVaTdjFPrPHVHLFugLBzCR
         eI6INzLoNRmrQ4evsIVU0okx7IAcdq+bgCUi3TxR90RTCstccy13PBu0JkAretNsZxI/
         55CmbUp7HxuOZN02WeSq1oOYUXnZPu+/RgfmFZrdrQoLUOUHJeVr+WuRFsjAyadgmSyH
         sftA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SkQkwwT1BYuhQbIUI6D5z390ZTBkLaXDUUGtWqBIXfg=;
        b=Y2P1sm1iKLEwa3xJIpNP0P8E7wJCjxmolocWBNdx80qcDhmY+02kEx7ckViwCGvDeR
         DymDHI4PiyB+JEH8xZEg0x3F+muafZz8L0SEIb+zC+mtsAUkSeUTZBG6dkLg22vbVeH9
         vt8oFBtnsPY6TetJ+qY6bhvSyLNg7Z4sQ0vG/NrjdSWgpiYgCTjamuqXowYmjhYMNlT7
         kzF5edQLHoalc9eDzLPy1GCz9ZhdxpVtjjRSM1JMPVLrVsR4JpzJ6obNB5w53s/O+AUo
         uGOSeRTH66Bq69jbnxwZA76jkGLq3rPvrzU+TgvQB7NemockaTgQ/kMv9qEte4I2B3co
         fs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SkQkwwT1BYuhQbIUI6D5z390ZTBkLaXDUUGtWqBIXfg=;
        b=ruUzMQTxrCgzID6sh056YTKRecixTPzOB8IlDp2VPlyqljfSogpWGiy8VxUe+qGJDo
         PUZokys3dKT39qIyBorAv1nehT3Qhbjxwr1M1V0XvcqJ9/hHywwGWwxs7qc/ipc3Tvd7
         mqqtfKcMuPrygo+Yfu51v5fw/nCQVIwnLOeGsTKmBzTcBGA9ESTrIXXnDXsx1zTSyKcg
         Eqy/0FZeOaifgpmHWBu+HxLa07GKgh8OybYIS6WQsKPMYBikFqCjAcgJcZbOvERVr/bB
         jrrKhpJBgAYC1+Ks3lRg3jpyCShFLBSRmxJZlRiaHPuxo5Np9GD8t/EufFus6SL0Zcnk
         9tEg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uViaX+2likMkBsNWFhOrhVoJcMMjNJjRPfpWKIsOvc6MG1SyA
	RT3BJx35tDxfV3ylsD+whgo=
X-Google-Smtp-Source: ABdhPJws9PkwPe733BavPYA/yAgkGrhoq0WjAustYMrP2sYkXsdrg7ccBtgOerWPTkdWiH6qJQEZhA==
X-Received: by 2002:aca:470d:: with SMTP id u13mr1374243oia.157.1591952906774;
        Fri, 12 Jun 2020 02:08:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:dbd7:: with SMTP id s206ls31223oig.6.gmail; Fri, 12 Jun
 2020 02:08:26 -0700 (PDT)
X-Received: by 2002:a54:4d96:: with SMTP id y22mr1296835oix.55.1591952906134;
        Fri, 12 Jun 2020 02:08:26 -0700 (PDT)
Date: Fri, 12 Jun 2020 02:08:25 -0700 (PDT)
From: Pratik Patil <prtptl.smilingcorpse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <564a7919-ca75-46d6-b69e-692c97c8c9fao@googlegroups.com>
In-Reply-To: <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com>
 <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
Subject: Re: Reboot root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_270_1249453979.1591952905419"
X-Original-Sender: prtptl.smilingcorpse@gmail.com
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

------=_Part_270_1249453979.1591952905419
Content-Type: text/plain; charset="UTF-8"

Thank you Jan for your reply.
If I skip the hardware initialization step and reboot using kexec system call, it should work. As per my understanding, inmates can run without Jailhouse. Or is it the case that jailhouse kernel module has to be always loaded for the non-root cells to run?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/564a7919-ca75-46d6-b69e-692c97c8c9fao%40googlegroups.com.

------=_Part_270_1249453979.1591952905419--
