Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBNGSVXUAKGQEU2D7URA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3f.google.com (mail-vs1-xe3f.google.com [IPv6:2607:f8b0:4864:20::e3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DB4CCA0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 13:08:37 +0200 (CEST)
Received: by mail-vs1-xe3f.google.com with SMTP id u17sf764996vsq.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Jun 2019 04:08:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561028916; cv=pass;
        d=google.com; s=arc-20160816;
        b=SwLbtr0BmJJLnSZGJQ9mGCcWuq8yQtpiGLcqMScTxkLWc0NeP+pFwd2bNsEzlVq68p
         UibqCjboo427fI4XBYNDflqtykr+eq6vYLI7LMIPN4G9VduTSNO40KlFiXGYP28W4RwF
         ZY7dOLKCX10UWyP/xAsembqECc+TyfMTyDh/U1FdC2vg0SYoEETT4fcwOC6MN1XkuHHG
         4Lf6lEvxTlLakfGf3ANMTASl9cIU+fnj5NZIJ20HCsP6GjfvO6tCFsD2wRyktak2ujsV
         KOzCtlGCxtkH3NnnSM/lmi+5jcC/19wzj3BQYkrY/N3I1Z2YBJ4giY9NxIvCddK/nelV
         cuvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=HWiYTO4Jebw3xGy6zeng8Tu5knouL3eQiqtRbJHEL9Y=;
        b=k7+5xbBQNSWtuqeZLjUX3vMGGEta3OwoNxMAneYWDKZ2dGpXHCzjhx6KRJfQx1EfGK
         x5mY16CT88l8ZU1mf5FswRivUMV9CkMLP9i8Rm5bppzLD56cufRl6YLe/iK+W0x7g1XH
         xesL6R7z68EfjUyNENeU50OQ+4xXcis8fWMvXzghL/nb/QuIhVBMcm8ZzeIGnka+GktF
         UywoI2B4l4W2he45chP12WRpl5G/ION981abGxXaQvYeOKjxb6taQLa+2JDlwbmOkxUS
         Dw70eDW1BA2zXlJ+JmugCdTeegAUKSOZXZ7E/c/Y1j+zxN3m5PmwU6iqR0hOO2h/iuRg
         H0ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wPenPTQk;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=HWiYTO4Jebw3xGy6zeng8Tu5knouL3eQiqtRbJHEL9Y=;
        b=S+/yuYYctr/XdWtdOqol8saCXGcAvIMFumEseaDqxMVCxIkH4DcFgqOTpxBChuLyAT
         NqGrVM6ud3ZtV+LvfrRxTndZZqkC8A0uOqKSmCB5rhXcAUJjrAp2tFnAv/LjtfNm7Me0
         hEGG4HiWjJ5p10wllOaLMnkkHJBtr2F41b1Zz1GooF4/ms2vgvsEvBvpP7l9ji/nKKhG
         +5Xu3QoynBY8NY7JHOvg3h5Di0OEhUeKBDMQadOENv9UEUEy3aevYRuyZJ1yB5QpMB4F
         YVzxC1TlkUf9WnVjPb8RcLmDBWEvJWV+p08A81TEmXR04w9kf53J3ZOqQWlg9gWB5+JO
         uk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HWiYTO4Jebw3xGy6zeng8Tu5knouL3eQiqtRbJHEL9Y=;
        b=QL8VZKT/B5jwMURyYqoPVRAmRvB9lI0uGOwjwGaDyapkBMDcklrAz4X+yFo0ITSBKk
         bc7QEo9ZJggzJSieAlbLttIsgJQubr9gIhFG9+BeYGTivx1WGy6GXJHekmU9hDQBEslG
         SNqOkrqiJzSsMMqQSqly/NP8Vp6mk/fxotRMPotMNOIOYTziKzSfQFEs7e5FP6R3ZC1e
         eayaDxH8ONqAN1trqYaaLrZ1rtns5uM+wPFWQLOTutfl9BXEJI2N9gQDX/TeB9t8CBpH
         jQydkuTy640SwdoK//iBj1pkB4KhTnR48n2g4OR6l5LrFx76waG190TobbzPIhvJYBor
         3hrA==
X-Gm-Message-State: APjAAAWdeZhBxbKoJyeHQ8KXGjKQgrTyCyRm08wMOtFtqVsO5JzKqD5z
	ra+eM2ErK3rlXvndQi0CqYw=
X-Google-Smtp-Source: APXvYqwlI07lSVMdFL+ZMl/Fp8cpzKZcY41svYYPd0I3jjN5RzNNC+zVK3IGTK1qvlbdohb3Y8VS/w==
X-Received: by 2002:a67:8c84:: with SMTP id o126mr43621813vsd.122.1561028916687;
        Thu, 20 Jun 2019 04:08:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:eec4:: with SMTP id o4ls577058vsp.11.gmail; Thu, 20 Jun
 2019 04:08:36 -0700 (PDT)
X-Received: by 2002:a67:fe5a:: with SMTP id m26mr3630870vsr.230.1561028916284;
        Thu, 20 Jun 2019 04:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561028916; cv=none;
        d=google.com; s=arc-20160816;
        b=zppVnxMT9SA3fnUGhe6WWpsPunQBkguJ+PpqZhkD5Xia+/tzajhAZKkaQ/8B3rq7J9
         iqfqS9DjOexZBeJHLg8n0XUPRwZ0e4zDmGC1deHsYiF+W90r1RdqJO/uVA1WmBsBG0lN
         0x7qBz9surBiC+zbPjCvWvwEuGEtQ/P5nY+2ZJPO8bfNgXJK4vLJXhNnTJkKnHkDh1t5
         3ovmtk7QUn1egw45Wze8y+NS+pKJLiRO3S3zSCSUFfzsdJ2cH0aNSibUxvpEaKYJegi3
         WP3odq11af3kNu5hItwQ9vy1RIICv7FLICCgBH24D35LMbXcxUAEXry3gmcJxO3NKwh3
         YKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=0gR9O8/PIoyEOKlU8iYmfcPcB3dAE9L0ZbeEZFOR/pU=;
        b=DprXVr/UcepaHuJjAJBroJkuOpJvNSp6JwCVOoE2iFX2ZmojJMrwLVQCplP7n2geOd
         Gs5j8lVo6g0f2qDkT2sVrZooSUQOmsaIcPQNFd+N5qsw13aqzMOd0DFY8vwZc5EPCwHf
         Tkq1UiYd86mcN73c5N78FILq7glNY1lBlohTmuTCligMcNr6O6UXbIxvNupBcgOa+B3O
         wa8O0XPpG8dz16K+nzT5B3d+b1IRbrMtGZzuwyZBVIysNdaDw0UbYrShXI0ldBw8FfX1
         bEtprJGVfsH9P/odFwMh7hIBnLIlJSw/WqrYDBPd7s+Xv7QP1Y8a4Px28eXljoxXAb0I
         WeZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wPenPTQk;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id 63si1505475vkn.0.2019.06.20.04.08.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 04:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KB8Zue015125
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 06:08:35 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KB8ZZS099789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 06:08:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 06:08:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 06:08:35 -0500
Received: from [172.24.217.248] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KB8Yqp002390
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Jun 2019 06:08:34 -0500
Subject: Re: [EXTERNAL] Writes to pages mapped via paging_get_guest_pages()
 not being reflected in the guest
To: <jailhouse-dev@googlegroups.com>
References: <6a2e95f8-acf5-0bb9-e35d-ace7ce020ddf@ti.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <076c6185-87a8-008c-ee69-23f800d04976@ti.com>
Date: Thu, 20 Jun 2019 16:38:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6a2e95f8-acf5-0bb9-e35d-ace7ce020ddf@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=wPenPTQk;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 20/06/19 2:53 PM, 'Pratyush Yadav' via Jailhouse wrote:
> Hi,
> 
> While debugging something, I wrote some data to guest pages mapped via paging_get_guest_pages(). I then flushed the cache using arm_dcaches_flush(mapped_page + offset_we_wrote_at, size, DCACHE_CLEAN_AND_INVALIDATE).
> 
> But then if I read the same memory from the Linux guest, the changes are not reflected there and the old value is read. Why is this so? Is arm_dcaches_flush() possibly bugged? Is something else wrong? The function looks all right to me at first glance.
> 
> The area of guest memory is allocated by Linux using dmam_alloc_coherent(), so I don't think a cache flush is needed on the guest side.

Nevermind. I was writing to the wrong pointer. It works as it was supposed to.

-- 
Regards,
Pratyush Yadav

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/076c6185-87a8-008c-ee69-23f800d04976%40ti.com.
For more options, visit https://groups.google.com/d/optout.
