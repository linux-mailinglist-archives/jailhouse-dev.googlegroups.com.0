Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYEU7SUAMGQED6NCBIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7A7BA9D0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Oct 2023 21:11:31 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 2adb3069b0e04-503343a850asf1290009e87.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Oct 2023 12:11:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1696533090; cv=pass;
        d=google.com; s=arc-20160816;
        b=Trq6vUnP33+zXdQNhSE1di/oiaI45nDIwEkmd0wUMofdReOZXdecbuV78LOSL1VfFI
         GgqX4n95VcobNIVrpAthFOw4OmJPAGaxR9TnENpPAufqtBnQjkLVOlADJDD29iZmMTZw
         XsxhrpNdjgNM4JcZrbOz6jySLuaTzR7mWUyjM6n5HtsFuqtEXeI7h+AZHv++8gtUXBVk
         M6rogHQh/L6Fwv4sQ+LmyG8mG1WzpZpXksz3lkFIQZDumeFibslonLVwA7pHb/mcYUYU
         C6TJCjhd51B99j++ZZ8Z71FFNPbOTJwSwJ6kXHcdWn76rwszXYN0suv2expKJkEahC6z
         N9jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=6i4WmionjmsG9/WLoBsZG55oOQm7qJVN/a8YJLu+YhU=;
        fh=OBUtSBb8cwNe7G7jC0Mqvz8LZrcHTbpJVHkerD3Maqk=;
        b=WkUkzp5c2sIboheejqxYCcV6toLqq5T6VaoeWNJEgsoy3xuf1szCN+0SZ08/CrFMu1
         idJx397LVAMrxJnWbiVSyy34Ukp/au5WCRswPEIuKHnyawRy2VgCfkkNwG0v+HTPEjya
         G2OAUVlmtJX41tcEQMn4aT9Ds647devDWSKsQwj78liP2Fli0YHPxVxcV8Z3WCeDfBt6
         WYP7DXklsnDSt4GHMn+qZ6u1gh3fPi8/GOYxC9UCBTy5MMmE3w4R1Al4DAYBMTSHN3CA
         +6UguEh+vCxnzT+FaKIfsRqWEiMEStk1Id48AphofLdolwJ1bAQfXmyq1HIqv45UX2jJ
         mu/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b="oN0u/fK9";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696533090; x=1697137890; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i4WmionjmsG9/WLoBsZG55oOQm7qJVN/a8YJLu+YhU=;
        b=aAHgVok7XCQt8QCEwT5XUxxld0UFRkXA69gxca7Rv2OvVqINQwD8Miin0HLEYI1c1E
         xUXQQb1Zy1nMPPpLWC52OBpR447fC7hIXL011Q+5Dm5LxnevzR2v9Y6nr7rpEzLnxD6T
         StMRx7iIiwU6/mbcHmo9p6i30PsLraw3gdXysbdnqZ0z/zD1IoTOSG8/D73PAWGMgeCo
         ie5vfpXmbZrYWRzDguUWXiPRKxQLdpQUI6C5+qex10ztI/7GJujwiWtGMIxkqDwPYk1m
         SIIJAoMJ0/wGhBbOTQZ8DxrJqrP+lS9bXCixg+KW2G2MnbbdhWtLJtdH2mfL6C1g5ISX
         ID3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533090; x=1697137890;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i4WmionjmsG9/WLoBsZG55oOQm7qJVN/a8YJLu+YhU=;
        b=XHrctcbCvYWcLYykDwEQLY4I3mNhdo79zFLCdX5YUzV88PPan4kFASC76b8VtpkuyF
         SOR+ICChHSl4xpiP+wYRdbqJ06WeOBAjD/ECO3BPdvcVEtZ9wEJYG+KNsi+ns3P2Or/h
         PhpTs4m1Vx5Uyz49dCoaOXTYWjJ5Rt1clO4FwfdwLtRmo1F3ai5D5xiukLVVCu5ksVey
         Ul1BTBqALlxI1Xy+rmLtXtH63d02fTCFuA/QlNJXqk2Kdu0EgBgD5tbnOSIn/zGqYgF3
         acG2CjhQD8tgiBfWayoNUkUMW0s8knJIPm3z5qiItCpe9G18joe7KwmtSt25Mg2TvLvp
         MZHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yymi0l7Ttvt7aODmBshOmYBYCqGdm6LPOh5Crs9v9qsiSj3Pdea
	yMpc4iUjS3Y/7tydCkjKxDo=
X-Google-Smtp-Source: AGHT+IH9tny31bxFYM+64M0x1Cep+zwi7GkWXge0kuuH5GRtzMzrvJDeroa+mkXc1vcbm5Pcnk++zg==
X-Received: by 2002:a19:5004:0:b0:503:3245:6eda with SMTP id e4-20020a195004000000b0050332456edamr5551078lfb.40.1696533089678;
        Thu, 05 Oct 2023 12:11:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a4ac:0:b0:2be:58d1:dc38 with SMTP id g12-20020a2ea4ac000000b002be58d1dc38ls225246ljm.1.-pod-prod-06-eu;
 Thu, 05 Oct 2023 12:11:26 -0700 (PDT)
X-Received: by 2002:a05:6512:10c8:b0:503:343a:829f with SMTP id k8-20020a05651210c800b00503343a829fmr7625111lfg.23.1696533086717;
        Thu, 05 Oct 2023 12:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696533086; cv=none;
        d=google.com; s=arc-20160816;
        b=WKu3nlK/yNBaV6Y1Btt0gPCgoBHhMJMXqNHnlwto7V4UuXVn2wV3339bx1nc6S3Aq3
         gGKYdGkQOGjB69z5wrrcqi2PbjS701r9gQo36aCjIXtN0AyZ//0D96aeSz5KA7R/kuou
         /Hs9FIPYW5bidpKMvk69jdUv65DMjwMg7NjEsSdFVQzly3DNUFmdoLqi69uCg6qlH2Et
         C2dPiErigM3xQsVWHgBV17KQK9Qu+Ymz4OknU+YAMh8gxusN2mUbMSCGyyZ5xt2mSymA
         JMUE6OvGuTbyuuALOqG7sKMi+4c7lnHOGQCWXM6okd8WryFsdhN7lyjORCcEUcuRSaEm
         y7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qmefgozTdPqtZSlaYToJQWETmfqSZxF8TGG/gzm5cdk=;
        fh=OBUtSBb8cwNe7G7jC0Mqvz8LZrcHTbpJVHkerD3Maqk=;
        b=Oh3KMRrfMOCS90yBkd7KRQ8zvzJIlyBXM7XP5JjaHJq4nNJ1AhRphE3LMBgmhbdANl
         0k4zDYW6Xuoga1Jk72AQHBZKZWb1G8r6qTc1zU5LP0TBfyscbglXa1pEvAr8g1IhyCA/
         ncPk4+Nqs0QVfSfifm0fetcQsvRmyBc2SqW2S7gYrrbB84/w3DEV5cKsULsmu8nfipXb
         aGQPippLpLjkaie6GiemiffXM+Qu+iehzJG/mmSrJKV1hwVOwOikUlFD671U4s5a6NMF
         qxJ+DN33IwIiQPUtaIlMICqjY4KqVclihE1CEc1/r7B9J+muDzwLeDaunDPyrI53B8RM
         IqWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b="oN0u/fK9";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id c22-20020ac25f76000000b0050446001e0bsi86315lfc.3.2023.10.05.12.11.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [IPv6:2001:638:a01:1096::13])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 416B92A0120;
	Thu,  5 Oct 2023 21:11:25 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4S1h4F01hYzxw9;
	Thu,  5 Oct 2023 21:11:25 +0200 (CEST)
Received: from [172.23.3.112] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 5 Oct
 2023 21:11:24 +0200
Message-ID: <16d9bc11-f820-48e3-955f-6beb04afc6f3@oth-regensburg.de>
Date: Thu, 5 Oct 2023 21:11:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to use a TTC timer with jailhouse
Content-Language: en-US
To: Sara Alonso <alonsosara44@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b="oN0u/fK9";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Sara,

On 05/10/2023 11:50, Sara Alonso wrote:
> Hi!
> 
> I want to create an inmate where I generate a periodic interrupt with a 
> TTC timer (I am using a zynq zcu102 board). The address of the TTC is 
> 0xFF120000 and the interrupt number is 71. I am writing the c code for 
> the inmate and I have used irq_init(Handler) and irq_enable(71) to 
> enable the interrupt, but now I don't know how to configure and start 
> the TTC timer. Are there any functions to do that? Or how could I do it?

For Jailhouse: Extend the configuration of the inmate by assigning the 
memory region to the guest. Second, add IRQ 71 to the irqchips member of 
the inmate's configuration. Cf. zynqmp-zcu102-linux-demo.c to see how 
specific interrupts are assigned to the cell.

Have a look at the Zynq's reference manual to see how the timer can be 
used and configured.

   Ralf

> 
> 
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/7ba359f8-b5ac-4a5b-b0f8-2a4988aae36en%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/16d9bc11-f820-48e3-955f-6beb04afc6f3%40oth-regensburg.de.
