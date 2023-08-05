Return-Path: <jailhouse-dev+bncBCN2LEHU5UCRBDV6W2TAMGQEAQVWF6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 928EE770CCF
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Aug 2023 03:00:00 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id d75a77b69052e-40ff238340fsf20536481cf.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Aug 2023 18:00:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1691197199; cv=pass;
        d=google.com; s=arc-20160816;
        b=s58jVeHZcZKsBGBx45c86RUYQCTHzPxCDQzml9R+DXCwFSMxJlV7oxd1yewFzwXyT2
         f8j0x2zFNWF9GwrvE39StsDqtIOaw/BtGccEoERr8JVS4AykwA2Sn/GEcpuQ++o9CiTe
         ihwfBABUX4ty4jQpu/Ao7MVTQfUFvJLEAHbLmh2+FfrR4OojdVHBV+/4xOCShFl7JFgn
         4aju28BN6M8KYusheYAXZkbqRS5oRvxVA3M2jRclq50Q+SXB65t2Nol/46SQdtxabwrw
         nOmj27E0bkGuKkmWMlzC6a8ePbHro5Ff5IBF02vr0gVY19w3xOF7BfSpJnZPUG3LTIHd
         jYzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=51b8ek8tq/EtnxJ8dh92i2LCsVkyJTarFWxXnLp3Qro=;
        fh=jj1MT8E/Vywl3cOkyTTGlJuwqdtr3H5Z4dj3R8yIJlE=;
        b=QuyzVNgj0m3j/qECquo9NVM4w+GCTHPgOd0aULPNUjV2LA8x2ci70X0stWoGdRKZhc
         B4MENtNTChBW8JHQf3d6X6GSXm9Dxfc3oi3ObiJKXXHKRk10msYmWPvWyU2yEdbaT4NN
         e4lWYQP8KfV1k0s7V4MVCXW7eqRaKo5mm5WSu5vv+o9mZ1Ag65iYLr+BkzTYF12nYud1
         SwVTCG7xv8qo5RpOD0bmVRPRdN5LHQ7/qeKAt4t/krnrmEK5OmoorcvW8NNqfz+5vqGw
         6R8k/D0T/V75uwHodqFuOdEoF9vje6dDPZDoEh4sfPgJXudxJu4hZetQdAZpnafn87fV
         LJIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="VvUaiNm/";
       spf=pass (google.com: domain of saradwer251@gmail.com designates 2607:f8b0:4864:20::730 as permitted sender) smtp.mailfrom=saradwer251@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1691197199; x=1691801999;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=51b8ek8tq/EtnxJ8dh92i2LCsVkyJTarFWxXnLp3Qro=;
        b=qbtZ5N3oqj3EMYC8f7dHGCRlihkFdmoBwGvqI7jx8T1mT7mkNKzCZsvsmbRQkGFBTJ
         9Qrz8FQ1JB2a8DgprTp387orD6uOy01wteo0E7Iwq4NMAbPpatOkoEklZZE4OEhRptik
         1Qok6OkbhUdrGHBZr0s7+hyjSmDG3SlRREdzC3EJBpiYNW9j89MrSm11rcD2iQEeY2km
         O+qeb+MlARa7YlJ7iRLdsGpQyXen9KSeqsystTKysMUtz5YtN2a4QfCnTeZVYQuI/yG/
         e3BpTnNe8d9vtBFXrCgeaViEH0YHPEQJOlq2Jef1Z4ueK/nuCuygV+y3nwUu5doHOm8X
         3B0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691197199; x=1691801999;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=51b8ek8tq/EtnxJ8dh92i2LCsVkyJTarFWxXnLp3Qro=;
        b=ZRYVssCncI3jtSGaTDlcJo9QaNos90Bugg7ZZ5s0LjRJ9nGlpnHO5tAYXgbuazUBDm
         gWdgkeaxQwX41/1fK37vcatwAfbnlmg9d4aDCi17HrV4dQrGT2yKyWePgM6LrIrmmrBz
         FqkE1hYEb3zYhcgIZItQ3PBh0+PrHl0lhNSvt89yXDEbL/X00CHjvgoyNjLSoEgQCdw5
         uY8REP8TWziPrQV+VTmwdUIKQFIL9azvLqPik4PmO9oOzHRi1pzDpTKlGUDRM3PQ/g8+
         U6CXU84/xhtSMr9m9clms80tQ1BWak+sSXLfHKa6pckpIOJF+x3fvSMJWa3e89ocSGGK
         6GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691197199; x=1691801999;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=51b8ek8tq/EtnxJ8dh92i2LCsVkyJTarFWxXnLp3Qro=;
        b=P1Gl+1K/Cq2dMYC50z4qP6rsHE+8Lko6v2MXEXvZ7s9KxPVSSahzJwucnsErDs47kM
         km0r+ZTkK3aHBETBDPJO2x9eyBXZ/ZcliawTYcLSPQElKq6cqGyYQ9L2u/9n/jlBQN8d
         cTwCVoZH2LU3ZaT8Ibpq4JtqRRlsYhZd8LG28BJe9SVzLb295xoCghFVKpI5hRr47uZK
         3KMECU2EdnHwK1D0Fx0xdnx2HO29eNkRvfFtfXiA/61+44stRGWmZvsxpeLgDFqTYXO3
         3LuRgxp0/RXHFb3WVWHksfjr69V79uEXjDYZXSHDykF5ThYM67gkEuv05UFT8nQldKd2
         gtJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzeMb6tjdTp6NI6bd/4l0LgdGMc/5VjzwCltsBaVkaA5cgLH6FG
	2gV9XXd1sWXruy8J9XyvzPk=
X-Google-Smtp-Source: AGHT+IGFR/fmuGoAB9AHJu0Yz8uA0ykpKsz92rHZ28hZTlP+8mlU3cb3T9Cs830FVvpmfQ12b/BVGg==
X-Received: by 2002:a05:622a:170c:b0:40f:f639:4265 with SMTP id h12-20020a05622a170c00b0040ff6394265mr4497842qtk.37.1691197199295;
        Fri, 04 Aug 2023 17:59:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:528e:0:b0:403:c0cb:532d with SMTP id s14-20020ac8528e000000b00403c0cb532dls262030qtn.1.-pod-prod-05-us;
 Fri, 04 Aug 2023 17:59:58 -0700 (PDT)
X-Received: by 2002:ac8:5f88:0:b0:40f:e15e:8f7f with SMTP id j8-20020ac85f88000000b0040fe15e8f7fmr5084606qta.53.1691197198156;
        Fri, 04 Aug 2023 17:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691197198; cv=none;
        d=google.com; s=arc-20160816;
        b=LDlNS5c5XBvCgPVBBE6tRPLE0oPfR10E4B/XOXNwIIFHZEJP1s0qAJVDFVxJuAFvWh
         QPX9mi4fBG73pNzh90U23c+ID5IxoqKdOprCjhqI0uWIpZiYNxRVS+c5i/7HThGCu4Gw
         5JSgdol1bjq2AEOLkOBvI4wMgOxpMDhLzgtpk9fJf4WrPfJk6tyFKpgM1LQ1ylKIR+xk
         aOu//s5PJ6Ja/dEaN+mUlcLqmH3iZP73BXiEFz8lbUwxyQ/ef5WxcQSb5S095x8ugfFY
         KM0OwKsBBpFy0LD5SeGc5RRaAiLnfD0hiwn9JwP9yJwnyuxkq4cLflxCnUjeuGR4EK4w
         WDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8koj75BtS85DjI8lXhfp0thrX0+pH/S9fSSEkH0PV2s=;
        fh=jj1MT8E/Vywl3cOkyTTGlJuwqdtr3H5Z4dj3R8yIJlE=;
        b=aRvZAThfOG12kdN93FqbM+/jPJr0B232IpKMLoHZXG1MK7SoWwqkf+b65WqRTKn+Or
         hCIt2V84SEcqH3CcU8/tcWiI2kdPyR1UD7WlO6EMCf/EMsT+npSgzz8QJz42gMk7WPpE
         m+Dp3tONiBbmAeMeWQovbf433yZlNDwCzclqLwOuQ1cqLGnjv7m1+edM01p48165CUJd
         UBR4WffsDfPMrYH/OsE8LZj0YrAYhqi9YoSMvif8Sr58OvQgqT7O41lgZPzz+gJ1co0v
         ssEU+L9R6kQNlh8ihSueKgO3cO9NfbLzG4lFIb27vmptJaN3yBraP6ITo1vMReB6eySS
         +6iA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="VvUaiNm/";
       spf=pass (google.com: domain of saradwer251@gmail.com designates 2607:f8b0:4864:20::730 as permitted sender) smtp.mailfrom=saradwer251@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com. [2607:f8b0:4864:20::730])
        by gmr-mx.google.com with ESMTPS id gc3-20020a05622a59c300b0040fd9cedc86si644167qtb.5.2023.08.04.17.59.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 17:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of saradwer251@gmail.com designates 2607:f8b0:4864:20::730 as permitted sender) client-ip=2607:f8b0:4864:20::730;
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-76ca7b4782cso209980585a.0
        for <jailhouse-dev@googlegroups.com>; Fri, 04 Aug 2023 17:59:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4410:b0:765:ab83:ef05 with SMTP id
 v16-20020a05620a441000b00765ab83ef05mr4405639qkp.56.1691197197080; Fri, 04
 Aug 2023 17:59:57 -0700 (PDT)
MIME-Version: 1.0
From: sarqa drev <saradwer251@gmail.com>
Date: Sat, 5 Aug 2023 02:59:00 +0200
Message-ID: <CAKu3oWPQypb6cDPLYo4SVcqokmXE00jM04JdOJBggMpS3uZYaQ@mail.gmail.com>
Subject: =?UTF-8?B?2YrYs9i52K/ZhtinINin2LPYqtmC2KjYp9mEINiu2LfYp9io2KfYqiDYp9mE2KrYsdi0?=
	=?UTF-8?B?2YrYrSAwMDIwMTA2Mjk5MjUxMCDZhtiq2YjYrNmHINin2YTZitmD2YUg2KjYrtin2YTYtSDYp9mE2Ko=?=
	=?UTF-8?B?2YLYr9mK2LEg2YjYp9mE2KfYrdiq2LHYp9mFLCDZiNmK2LPYsdmG2Kcg2KfZhNiq2YbZiNmK2Kkg2Lk=?=
	=?UTF-8?B?2YYg2LTZh9in2K/YqSDYp9mE2KfYudiq2YXYp9ivLCwsINil2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2Yo=?=
	=?UTF-8?B?2Lkg2KfZhNil2K3Yqtix2KfZgdmK2KkgKFByb2plY3QgTWFuYWdlbWVudCBQcm9mZXNzaW9uYWwgKFBN?=
	=?UTF-8?B?UCDYp9mE2YLYp9mH2LHYqSDigJMg2KzZhdmH2YjYsdmK2Kkg2YXYtdixINin2YTYudix2KjZitipIC8g?=
	=?UTF-8?B?2KfZiNmGINmE2KfZitmGINmB2Yog2K3Yp9mEINiq2LnYsNixINin2YTYrdi22YjYsSDYqtin2LHZitiu?=
	=?UTF-8?B?INin2YTYqNiv2KEgOiA2INin2LrYs9i32LMgMjAyMyDZhSDigJMg2KrYp9ix2YrYriDYp9mE2KfZhtiq?=
	=?UTF-8?B?2YfYp9ihIDMg2KfZg9iq2YjYqNixIDIwMjMg2YUg2YjYp9mE2YXYudiq2YXYryDZhdmGINin2YTYr9in?=
	=?UTF-8?B?2LEg2KfZhNi52LHYqNmK2Kkg2YTZhNiq2YbZhdmK2Kkg2KfZhNin2K/Yp9ix2YrYqSDigJMgQUhBRCA=?=
	=?UTF-8?B?2LTZh9in2K/YqSDYqNiq2LXYr9mK2YIg2K3Zg9mI2YXZiiDZiNiq2YjYq9mK2YIg2YXZhiDYrtin2LE=?=
	=?UTF-8?B?2KzZitipINmD2YDZgNmA2YDYp9mB2Kkg2KfZhNiv2YjZhCDYp9mE2LnYsdio2YrYqSDZhdi52YTZiNmF?=
	=?UTF-8?B?2KfYqiDYudmGINin2YTYtNmH2KfYr9ipIDotINmK2YXZg9mGINin2YTYp9iz2KrZgdin2K/YqSDZhdmG?=
	=?UTF-8?B?INiv2YjYsdin2KogUE1QINmB2Yog2YPZhCDYp9mE2K/ZiNmEINiq2YLYsdmK2KjZi9in2Iwg2K3Zitir?=
	=?UTF-8?B?INiq2KrZhdir2YQg2YHYp9im2K/YqSDYtNmH2KfYr9ipINil2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2Yo=?=
	=?UTF-8?B?2Lkg2KfZhNin2K3Yqtix2KfZgdmK2KkgUE1QINmB2Yog2KPZhtmH2Kcg2YXYudiq2LHZgSDYqNmH2Kcg?=
	=?UTF-8?B?2LnYp9mE2YXZitin2YsuINmB2YXYuSDYtNmH2KfYr9ipIFBNUNiMINmK2YXZg9mG2YM=?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002d61ab0602228859"
X-Original-Sender: saradwer251@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b="VvUaiNm/";       spf=pass
 (google.com: domain of saradwer251@gmail.com designates 2607:f8b0:4864:20::730
 as permitted sender) smtp.mailfrom=saradwer251@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000002d61ab0602228859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

KtmK2LPYudiv2YbYpyDYp9iz2KrZgtio2KfZhCDYrti32KfYqNin2Kog2KfZhNiq2LHYtNmK2K0g
MDAyMDEwNjI5OTI1MTAqDQoNCg0KDQoq2YbYqtmI2KzZhyDYp9mE2YrZg9mFINio2K7Yp9mE2LUg
2KfZhNiq2YLYr9mK2LEg2YjYp9mE2KfYrdiq2LHYp9mFLCDZiNmK2LPYsdmG2Kcg2KfZhNiq2YbZ
iNmK2Kkg2LnZhiDYtNmH2KfYr9ipINin2YTYp9i52KrZhdin2K8sLCwqDQoNCirYpdiv2KfYsdip
INin2YTZhdi02KfYsdmK2Lkg2KfZhNil2K3Yqtix2KfZgdmK2KkqDQoNCiogKCoqUHJvamVjdCBN
YW5hZ2VtZW50IFByb2Zlc3Npb25hbCAoUE1QKg0KDQoq2KfZhNmC2KfZh9ix2Kkg4oCTINis2YXZ
h9mI2LHZitipINmF2LXYsSDYp9mE2LnYsdio2YrYqSAvINin2YjZhiDZhNin2YrZhiDZgdmKINit
2KfZhCDYqti52LDYsSDYp9mE2K3YttmI2LEqDQoNCirYqtin2LHZitiuINin2YTYqNiv2KEgOiA2
INin2LrYs9i32LMgMjAyMyDZhSDigJMg2KrYp9ix2YrYriDYp9mE2KfZhtiq2YfYp9ihIDMg2KfZ
g9iq2YjYqNixIDIwMjMg2YUqDQoNCtmI2KfZhNmF2LnYqtmF2K8g2YXZhiDYp9mE2K/Yp9ixINin
2YTYudix2KjZitipINmE2YTYqtmG2YXZitipINin2YTYp9iv2KfYsdmK2Kkg4oCTIEFIQUQNCg0K
2LTZh9in2K/YqSDYqNiq2LXYr9mK2YIg2K3Zg9mI2YXZiiDZiNiq2YjYq9mK2YIg2YXZhiDYrtin
2LHYrNmK2Kkg2YPZgNmA2YDZgNin2YHYqSDYp9mE2K/ZiNmEINin2YTYudix2KjZitipDQoNCtmF
2LnZhNmI2YXYp9iqINi52YYg2KfZhNi02YfYp9iv2KkgOi0NCg0K2YrZhdmD2YYg2KfZhNin2LPY
qtmB2KfYr9ipINmF2YYg2K/ZiNix2KfYqiBQTVAg2YHZiiDZg9mEINin2YTYr9mI2YQg2KrZgtix
2YrYqNmL2KfYjCDYrdmK2Ksg2KrYqtmF2KvZhCDZgdin2KbYr9ipINi02YfYp9iv2KkNCtil2K/Y
p9ix2Kkg2KfZhNmF2LTYp9ix2YrYuSDYp9mE2KfYrdiq2LHYp9mB2YrYqSBQTVAg2YHZiiDYo9mG
2YfYpyDZhdi52KrYsdmBINio2YfYpyDYudin2YTZhdmK2KfZiy4g2YHZhdi5INi02YfYp9iv2Kkg
UE1Q2IwNCtmK2YXZg9mG2YMg2KfZhNi52YXZhCDZgdmKINij2Yog2LXZhtin2LnYqSDYqtmC2LHZ
itio2YvYpyDZiNmB2Yog2KPZiiDZhdmD2KfZhi4NCg0K2KrZgtiv2YUg2LTZh9in2K/YqSBQTVAg
2KfZhNi52K/ZitivINmF2YYg2KfZhNmB2YjYp9im2K8g2YTZg9mEINmF2YYg2KfZhNmF2YjYuNmB
2YrZhiDZiNij2LHYqNin2Kgg2LnZhdmE2YfZhS4g2K3ZitirINmK2YXZg9mGDQrYp9mE2YXZhti4
2YXYp9iqINin2YTYqtmKINmE2K/ZitmH2Kcg2YXYr9ix2KfYoSDZhdi02KfYsdmK2Lkg2YXYudiq
2YXYr9mI2YYg2YTYr9mJIFBNUCDYttmF2KfZhiDYqtiz2YTZitmFINin2YTZhdi02KfYsdmK2Lkg
2YHZig0K2KfZhNmI2YLYqiDYp9mE2YXYrdiv2K8g2YjZiNmB2YLZi9inINmE2YTZhdmK2LLYp9mG
2YrYqSDYp9mE2YXYrdiv2K/YqSDYqNin2YTYpdi22KfZgdipINil2YTZiSDYqtmE2KjZitipINis
2YXZiti5INij2YfYr9in2YENCtin2YTZhdi02LHZiNi5LiDZhdmGINmG2KfYrdmK2Kkg2KPYrtix
2YnYjCDZitmF2YPZhiDZhNmE2YXZiNi42YHZitmGINin2YTYp9iz2KrZhdiq2KfYuSDYqNmF2LHY
qtio2KfYqiDYo9i52YTZiSDZiNio2KfZhNmF2LLZitivINmF2YYNCtmB2LHYtSDYp9mE2LnZhdmE
Lg0KDQrYqti02YrYsSDYtNmH2KfYr9ipINil2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2YrYuSDYp9mE
2KfYrdiq2LHYp9mB2YrYqSBQTVAg2KXZhNmJINij2YbZgyDYudi22Ygg2YXYudiq2LHZgSDYqNmH
INi52KfZhNmF2YrZi9inINmB2YoNCtmF2KzZhdmI2LnYqSDZhdmF2YrYstipINmF2YYg2YXYr9mK
2LHZiiDYp9mE2YXYtNin2LHZiti5LiDZg9mF2Kcg2KPZhtmH2Kcg2KrYtNmK2LEg2KXZhNmJINin
2YXYqtmE2KfZg9mDINin2YTZhdmH2KfYsdin2Kog2YjYp9mE2YXYudix2YHYqQ0K2KfZhNmE2KfY
stmF2Kkg2YTYqtmE2KjZitipINmF2KrYt9mE2KjYp9iqINij2Yog2YXYtNix2YjYuS4NCg0KKtmB
2YjYp9im2K8g2LTZh9in2K/YqSAqKlBNUCoqOioNCg0K2YrZhdmD2YYg2KPZhiDZitmB2YrYryDY
p9mE2K3YtdmI2YQg2LnZhNmJINi02YfYp9iv2KkgUE1QINit2YrYp9iq2YMg2KfZhNmF2YfZhtmK
2Kkg2KjYudiv2Kkg2LfYsdmCLiDZitmF2YPZhjoNCg0KwrcgICAgICAgICDYstmK2KfYr9ipINmB
2LHYtdmDINmB2Yog2KfZhNmD2LPYqDog2YjZgdmC2YvYpyDZhNin2LPYqtio2YrYp9mGINix2YjY
p9iq2KggUE1JJ3MgRWFybmluZyBQb3dlctiMDQrZitit2LXZhCDYp9mE2YXYrdiq2LHZgdmI2YYg
2KfZhNit2KfYtdmE2YjZhiDYudmE2Ykg2LTZh9in2K/YqSBQTVAg2LnZhNmJINix2KfYqtioINij
2LnZhNmJINmF2YYg2KfZhNmF2K3Yqtix2YHZitmGINi62YrYsQ0K2KfZhNmF2LnYqtmF2K/ZitmG
Lg0KDQrCtyAgICAgICAgINi52LLYsiDZhdi12K/Yp9mC2YrYqtmDOiDYtNmH2KfYr9ipIFBNUCDZ
hdi52KrYsdmBINio2YfYpyDZiNmF2K3Yqtix2YXYqSDYudin2YTZhdmK2YvYp9iMINmI2YfZiiDY
qtmI2LbYrQ0K2KfZhNiq2LLYp9mF2YMg2KjZhdmH2YbYqSDYpdiv2KfYsdipINin2YTZhdi02LHZ
iNi5Lg0KDQrCtyAgICAgICAgINmB2KrYrSDZgdix2LUg2YjYuNmK2YHZitipOiDYqtiq2LfZhNio
INin2YTYudiv2YrYryDZhdmGINin2YTZhdik2LPYs9in2Kog2LTZh9in2K/YqSBQTVAg2KPZiCDY
qtmB2LbZhNmH2Kcg2YTYtNi62YQNCtmF2YbYp9i12Kgg2KXYr9in2LHYqSDYp9mE2YXYtNin2LHZ
iti52Iwg2YjZitmF2YPZhiDYo9mGINmK2LPYp9i52K/ZgyDYp9mE2K3YtdmI2YQg2LnZhNmJINin
2YTYtNmH2KfYr9ipINmB2Yog2KfZhNiq2YXZitiyINmB2Yog2LPZiNmCDQrYudmF2YQg2KrZhtin
2YHYs9mKLg0KDQrCtyAgICAgICAgINiq2K3Ys9mK2YYg2YXZh9in2LHYp9iq2YMg2YHZiiDYpdiv
2KfYsdipINin2YTZhdi02KfYsdmK2Lk6INmK2KrYt9mE2Kgg2KfZhNiq2K3YttmK2LEg2YTYp9mF
2KrYrdin2YYgUE1QINmB2YfZhdin2YsNCti52YXZitmC2KfZiyDZhNmF2KjYp9iv2KYg2KXYr9in
2LHYqSDYp9mE2YXYtNin2LHZiti5INmI2KPZgdi22YQg2KfZhNmF2YXYp9ix2LPYp9iq2Iwg2YjY
p9mE2KrZiiDZitmF2YPZhiDYo9mGINiq2K3Ys9mGINmC2K/Ysdiq2YMg2LnZhNmJDQrYpdiv2KfY
sdipINin2YTZhdi02KfYsdmK2Lkg2KjZgdi52KfZhNmK2KkuDQoNCtin2YTYo9mH2K/Yp9mBINin
2YTYqtmB2LXZitmE2YrYqSDZhNmE2KjYsdmG2KfZhdisINin2YTYqtiv2LHZitio2Yog2YTZhNit
2LXZiNmEINi52YTZiSDYp9mE2LTZh9in2K/YqQ0KDQrYqNix2YbYp9mF2Kwg2KfYr9in2LHYqSDY
p9mE2YXYtNix2YjYudin2Kog2KfZhNin2K3Yqtix2KfZgdmK2KkgUE1QINmK2LPYp9i52K8g2YXY
r9mK2LHZiiDYp9mE2YXYtNix2YjYudin2Kog2KjYp9mE2YXYpNiz2LPYp9iqDQrZiNin2YTYtNix
2YPYp9iqINmE2YTYqti52LHZgSDYudmE2Yog2KfZhNmF2YfYp9ix2KfYqiDYp9mE2LnZhNmF2YrY
qSDZiNin2YTYqti32KjZitmC2YrYqSDZiNin2YTZgdmG2YrYqSDYp9mE2YTYp9iy2YXYqSDZhNin
2K/Yp9ix2Kkg2KfZig0K2YXYtNix2YjYuSDYqNmG2KzYp9itINmI2YPZitmB2YrYqSDYp9mE2KrY
rti32YrYtyDYp9mE2KzZitivINmE2YTYp9i52YXYp9mEINin2YTYsNmKINmK2LPYp9i52K8g2KfZ
hNmF2LTYsdmI2Lkg2LnZhNmKINin2YTYsdio2YrYrdmK2KkNCtmI2KfZhNmG2KzYp9itINiMINmD
2YXYpyDYp9mG2Ycg2YrYudivINio2LHZhtin2YXYrCDYqtiv2LHZitio2Yog2YXYqtmI2KfZgdmC
INmF2Lkg2YXZhtmH2KzZitipINil2K/Yp9ix2Kkg2KfZhNmF2LTYsdmI2LnYp9iqINmI2YHZgtin
2YsNCtmE2YXYudmH2K8g2KXYr9in2LHYqSDYp9mE2YXYtNix2YjYudin2Kog2KfZhNin2YXYsdmK
2YPZiiBQTUkgLiDZh9iw2Kcg2KfZhNio2LHZhtin2YXYrCDZitmI2YHYsSDZhNmDINin2YTZgdix
2LXYqSDZhNmE2K3YtdmI2YQg2LnZhNmJDQrYtNmH2KfYr9ipIFBNUCDYp9mE2K/ZiNmE2YrYqSDY
p9mE2YXYudiq2YXYr9ipINmF2YYg2K7ZhNin2YQg2KfZhNiq2K/YsdmK2Kgg2KfZhNin2K3Yqtix
2KfZgdmKINmI2KfZhNmF2KrZhdmK2LIg2YjYp9mE2LDZiiDZitik2YfZhNmDDQrZhNmE2KrZgtiv
2YUg2KfZhNmJINin2YXYqtit2KfZhiDYp9mE2YXYudmH2K8g2KfZhNin2YXYsdmK2YPZiiDZhNin
2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2YrYuSBQTUkg2YjZgdmC2Kcg2YTYtNix2YjYtyDYp9mE2YXY
udmH2K8uDQoNCtiq2LrYt9mK2Kkg2YXYudix2YHZitipINi02KfZhdmE2Kkg2YTZg9mEINmF2YjY
p9i22YrYuSDYpdiv2KfYsdipINin2YTZhdi02LHZiNi52KfYqi4NCg0K2KfZhNiq2LnYsdmBINi5
2YTZiSDZg9mK2YHZitipINiq2K3Yr9mK2K8g2KfZhNij2LnZhdin2YQg2KfZhNiu2KfYtdipINio
2KfZhNmF2LTYsdmI2Lkg2YjYqtmD2YjZitmGINmB2LHZgiDYp9mE2LnZhdmELg0KDQrYp9mE2YXZ
hdin2LHYs9ipINin2YTYudmF2YTZitipINmE2YXYsdin2YLYqNipINin2YTZhdi02LHZiNi5INmI
2LbYqNi32YcuDQoNCtin2YTYqti32KjZitmCINin2YTYudmF2YTZiiDZhNmE2KrYrti32YrYtyDY
p9mE2LLZhdmG2Yog2YjYp9mE2YXYp9mE2Yog2YTZhNmF2LTYsdmI2LnYp9iqLg0KDQrYqti62LfZ
itipINmD2YQg2YXZiNin2LbZiti5INin2YXYqtit2KfZhiAoUE1QKSDYp9mE2KrZiiDYqtmF2YPZ
hiDYp9mE2YXYqtiv2LHYqCDZhdmGINin2KzYqtmK2KfYsiDYp9mE2KfZhdiq2K3Yp9mGLg0KDQrY
qti32KjZitmCINmF2YfYp9ix2KfYqiDYpdiv2KfYsdipINin2YTZhdi02KfYsdmK2Lkg2YjYp9mE
2KPYr9mI2KfYqiDZiNin2YTYqtmC2YbZitin2Kog2YTYqtiz2YTZitmFINin2YTZhdi02KfYsdmK
2Lkg2YHZiiDYp9mE2YjZgtiqDQrYp9mE2YXYrdiv2K8g2YjZgdmKINit2K/ZiNivINin2YTZhdmK
2LLYp9mG2YrYqS4NCg0K2LTYsditINmD2KfZhdmEINin2YTZhdmG2YfYrCDYqNi32LHZitmC2Kkg
2LPZh9mE2Kkg2YjYqNiz2YrYt9ipINmI2LTZitmC2KkuDQoNCtiq2LfYqNmK2YLYp9iqINi52YXZ
hNmK2Kkg2KjYp9iz2KrYrtiv2KfZhSDYqNix2YbYp9mF2KwgTWljcm9zb2Z0IFByb2plY3QuDQoN
Ctin2LPYqtiu2K/Yp9mFINmD2KrYp9ioINil2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2YrYuSDYp9mE
2YXYudix2YHZitipICJQTUJPSyDigJMg2KfZhNil2LXYr9in2LHYp9mE2LPYp9iv2LMg2YjYp9mE
2KfYtdiv2KfYsQ0K2KfZhNiz2KfYqNi5IiDZiNiv2YTZitmEINmF2YXYp9ix2LPYqSBBZ2lsZSDZ
iNmB2YfZhSDZhdiq2LfZhNio2KfYqiDYtNmH2KfYr9ipINin2K7Yqtio2KfYsSBQTVAg2YjZhti1
2KfYptitINmE2KfYrNiq2YrYp9iyDQrYp9mE2KfYrtiq2KjYp9ixDQoNCtmE2YTYqtiz2KzZitmE
INmI2KfZhNin2LTYqtix2KfZgyDZgdmKINin2YTYtNmH2KfYr9in2Kog2KfZhNmF2YfZhtmK2Kkg
2KfZhNmF2LnYqtmF2K/YqQ0KDQoq2YbYtNmD2LHZgyDYudmE2Ykg2KvZgtiq2YMg2KfZhNi62KfZ
hNmK2Kkg2KfZhNiq2Ykg2YbYudiq2LIg2KjZh9inINmB2Ykg2KjYr9in2YrYqSDYqti52KfZiNmG
INmF2KvZhdixINmIINio2YbYp9ihINil2YYg2LTYp9ihDQrYp9mE2YTZhywg2YjZitmF2YPZhtmD
INin2YTYpdi02KrYsdin2YMg2YjYp9mE2KrYs9is2YrZhCDZg9in2YTYotiq2YoqKjoqDQoNCtiq
2YDYo9mD2YDZitivINin2YTYp9i02KrYsdin2YMgOg0KDQrZitiq2YUg2KrYo9mD2YrYryDYp9mE
2KfYtNiq2LHYp9mDINio2LnYryDYs9iv2KfYryDYsdiz2YjZhSDYp9mE2LTZh9in2K/YqSDYs9mI
2KfYoSDZhtmC2K/YpyDYo9mIINio2LTZitmDINij2Ygg2KjYp9mE2KrYrdmI2YrZhA0K2KfZhNio
2YbZg9mKLg0KDQrZg9mK2YHZitipINin2YTYqtiz2KzZitmEINmI2KfZhNin2LTYqtix2KfZgzoN
Cg0KKtiz2KfYsdipINi52KjYryDYp9mE2KzZiNin2K8qDQoNCiowMDIwMTA2Mjk5MjUxMCAvIDAw
MjAxMDk2ODQxNjI2Kg0KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlv
dSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBncm91cC4K
VG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMg
ZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2ds
ZWdyb3Vwcy5jb20uClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0
cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0FLdTNvV1BReXBi
NmNEUExZbzRTVmNxb2ttWEUwMGpNMDRKZE9KQmdnTXBTM3VaWWFRJTQwbWFpbC5nbWFpbC5jb20u
Cg==
--0000000000002d61ab0602228859
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in=
 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot=
;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" style=3D"=
font-size:22pt;color:rgb(49,132,155)">=D9=8A=D8=B3=D8=B9=D8=AF=D9=86=D8=A7
=D8=A7=D8=B3=D8=AA=D9=82=D8=A8=D8=A7=D9=84 =D8=AE=D8=B7=D8=A7=D8=A8=D8=A7=
=D8=AA =D8=A7=D9=84=D8=AA=D8=B1=D8=B4=D9=8A=D8=AD 00201062992510</span></b>=
<b><span dir=3D"LTR" style=3D"font-size:22pt;font-family:Arial,&quot;sans-s=
erif&quot;;color:rgb(49,132,155)"></span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><b><span lang=3D"AR-EG" style=3D"font-size:22pt;co=
lor:rgb(49,132,155)">=C2=A0</span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><b><span lang=3D"AR-EG" style=3D"font-size:22pt;co=
lor:rgb(49,132,155)">=D9=86=D8=AA=D9=88=D8=AC=D9=87 =D8=A7=D9=84=D9=8A=D9=
=83=D9=85 =D8=A8=D8=AE=D8=A7=D9=84=D8=B5 =D8=A7=D9=84=D8=AA=D9=82=D8=AF=D9=
=8A=D8=B1 =D9=88=D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=85, =D9=88=D9=
=8A=D8=B3=D8=B1=D9=86=D8=A7 =D8=A7=D9=84=D8=AA=D9=86=D9=88=D9=8A=D8=A9 =D8=
=B9=D9=86
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D8=A7=D9=84=D8=A7=D8=B9=D8=AA=D9=85=D8=A7=
=D8=AF,,,</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-SA" style=3D"font-size:36pt;color:rgb(23,54,93)">=D8=A5=D8=AF=D8=A7=
=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9
=D8=A7=D9=84=D8=A5=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-SA" style=3D"font-size:24pt;color:rgb(49,132,155)">=C2=A0(</span></b=
><b><span dir=3D"LTR" style=3D"font-size:24pt;font-family:Arial,&quot;sans-=
serif&quot;;color:rgb(49,132,155)">Project Management Professional (PMP</sp=
an></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-EG" style=3D"font-size:20pt;font-family:&quot;Simplified Arabic&quot=
;,&quot;serif&quot;;color:black">=D8=A7=D9=84=D9=82=D8=A7=D9=87=D8=B1=D8=A9=
 =E2=80=93
=D8=AC=D9=85=D9=87=D9=88=D8=B1=D9=8A=D8=A9 =D9=85=D8=B5=D8=B1 =D8=A7=D9=84=
=D8=B9=D8=B1=D8=A8=D9=8A=D8=A9 / =D8=A7=D9=88=D9=86 =D9=84=D8=A7=D9=8A=D9=
=86 =D9=81=D9=8A =D8=AD=D8=A7=D9=84 =D8=AA=D8=B9=D8=B0=D8=B1 =D8=A7=D9=84=
=D8=AD=D8=B6=D9=88=D8=B1</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-EG" style=3D"font-size:20pt;font-family:&quot;Simplified Arabic&quot=
;,&quot;serif&quot;;color:rgb(148,54,52)">=D8=AA=D8=A7=D8=B1=D9=8A=D8=AE =
=D8=A7=D9=84=D8=A8=D8=AF=D8=A1 : 6 =D8=A7=D8=BA=D8=B3=D8=B7=D8=B3 2023 =D9=
=85 =E2=80=93 =D8=AA=D8=A7=D8=B1=D9=8A=D8=AE =D8=A7=D9=84=D8=A7=D9=86=D8=AA=
=D9=87=D8=A7=D8=A1 3
=D8=A7=D9=83=D8=AA=D9=88=D8=A8=D8=B1 2023 =D9=85</span></b></p>

<p align=3D"center" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;text-align=
:center;background-image:initial;background-position:initial;background-siz=
e:initial;background-repeat:initial;background-origin:initial;background-cl=
ip:initial;direction:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quo=
t;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-EG" style=3D"fo=
nt-size:22pt;color:rgb(23,54,93);letter-spacing:0.25pt">=D9=88=D8=A7=D9=84=
=D9=85=D8=B9=D8=AA=D9=85=D8=AF =D9=85=D9=86 =D8=A7=D9=84=D8=AF=D8=A7=D8=B1 =
=D8=A7=D9=84=D8=B9=D8=B1=D8=A8=D9=8A=D8=A9 =D9=84=D9=84=D8=AA=D9=86=D9=85=
=D9=8A=D8=A9 =D8=A7=D9=84=D8=A7=D8=AF=D8=A7=D8=B1=D9=8A=D8=A9 =E2=80=93=C2=
=A0</span><span dir=3D"LTR" style=3D"font-size:22pt;font-family:Cambria,&qu=
ot;serif&quot;;color:rgb(23,54,93);letter-spacing:0.25pt">AHAD</span><span =
lang=3D"AR-SA" style=3D"font-size:26pt;font-family:Arial,&quot;sans-serif&q=
uot;;color:rgb(23,54,93);letter-spacing:0.25pt"></span></p>

<p align=3D"center" dir=3D"RTL" style=3D"margin:0in 0in 15pt;text-align:cen=
ter;background-image:initial;background-position:initial;background-size:in=
itial;background-repeat:initial;background-origin:initial;background-clip:i=
nitial;direction:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-s=
ize:22pt;color:rgb(23,54,93);letter-spacing:0.25pt">=D8=B4=D9=87=D8=A7=D8=
=AF=D8=A9 =D8=A8=D8=AA=D8=B5=D8=AF=D9=8A=D9=82 =D8=AD=D9=83=D9=88=D9=85=D9=
=8A =D9=88=D8=AA=D9=88=D8=AB=D9=8A=D9=82 =D9=85=D9=86
=D8=AE=D8=A7=D8=B1=D8=AC=D9=8A=D8=A9 =D9=83=D9=80=D9=80=D9=80=D9=80=D8=A7=
=D9=81=D8=A9 =D8=A7=D9=84=D8=AF=D9=88=D9=84 =D8=A7=D9=84=D8=B9=D8=B1=D8=A8=
=D9=8A=D8=A9</span></p>

<p dir=3D"RTL" style=3D"margin:0in 0in 15pt;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:e=
mbed;font-size:12pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quo=
t;"><span lang=3D"AR-EG" style=3D"font-size:22pt;color:rgb(148,54,52);lette=
r-spacing:0.25pt">=D9=85=D8=B9=D9=84=D9=88=D9=85=D8=A7=D8=AA
=D8=B9=D9=86 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 :-</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D9=8A=D9=85=D9=83=D9=86 =D8=A7=D9=84=D8=A7=D8=B3=D8=
=AA=D9=81=D8=A7=D8=AF=D8=A9
=D9=85=D9=86 =D8=AF=D9=88=D8=B1=D8=A7=D8=AA</span><span dir=3D"LTR"></span>=
<span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-fam=
ily:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span> PMP </span><span lang=3D"AR-EG" style=3D"font-size:16=
pt;color:black;letter-spacing:0.25pt">=D9=81=D9=8A =D9=83=D9=84 =D8=A7=D9=
=84=D8=AF=D9=88=D9=84
=D8=AA=D9=82=D8=B1=D9=8A=D8=A8=D9=8B=D8=A7=D8=8C =D8=AD=D9=8A=D8=AB =D8=AA=
=D8=AA=D9=85=D8=AB=D9=84 =D9=81=D8=A7=D8=A6=D8=AF=D8=A9 =D8=B4=D9=87=D8=A7=
=D8=AF=D8=A9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=
=D8=B1=D9=8A=D8=B9 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=
=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D=
"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing=
:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><spa=
n lang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"=
>=D9=81=D9=8A =D8=A3=D9=86=D9=87=D8=A7 =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=
=A8=D9=87=D8=A7 =D8=B9=D8=A7=D9=84=D9=85=D9=8A=D8=A7=D9=8B. =D9=81=D9=85=D8=
=B9
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;co=
lor:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"=
></span> PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span><span =
lang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"><=
span dir=3D"RTL"></span><span dir=3D"RTL"></span>=D8=8C =D9=8A=D9=85=D9=83=
=D9=86=D9=83 =D8=A7=D9=84=D8=B9=D9=85=D9=84 =D9=81=D9=8A =D8=A3=D9=8A =D8=
=B5=D9=86=D8=A7=D8=B9=D8=A9 =D8=AA=D9=82=D8=B1=D9=8A=D8=A8=D9=8B=D8=A7 =D9=
=88=D9=81=D9=8A =D8=A3=D9=8A =D9=85=D9=83=D8=A7=D9=86</span><span dir=3D"LT=
R"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16p=
t;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"><=
/span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D9=82=D8=AF=D9=85 =D8=B4=D9=87=D8=A7=D8=AF=D8=
=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LT=
R" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.=
25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><span l=
ang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
=D8=A7=D9=84=D8=B9=D8=AF=D9=8A=D8=AF =D9=85=D9=86 =D8=A7=D9=84=D9=81=D9=88=
=D8=A7=D8=A6=D8=AF =D9=84=D9=83=D9=84 =D9=85=D9=86 =D8=A7=D9=84=D9=85=D9=88=
=D8=B8=D9=81=D9=8A=D9=86
=D9=88=D8=A3=D8=B1=D8=A8=D8=A7=D8=A8 =D8=B9=D9=85=D9=84=D9=87=D9=85. =D8=AD=
=D9=8A=D8=AB =D9=8A=D9=85=D9=83=D9=86 =D8=A7=D9=84=D9=85=D9=86=D8=B8=D9=85=
=D8=A7=D8=AA =D8=A7=D9=84=D8=AA=D9=8A =D9=84=D8=AF=D9=8A=D9=87=D8=A7 =D9=85=
=D8=AF=D8=B1=D8=A7=D8=A1 =D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=85=D8=B9=
=D8=AA=D9=85=D8=AF=D9=88=D9=86 =D9=84=D8=AF=D9=89</span><span dir=3D"LTR"><=
/span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;fo=
nt-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></spa=
n><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-EG" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B6=D9=85=D8=A7=D9=86 =D8=AA=
=D8=B3=D9=84=D9=8A=D9=85 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =
=D9=81=D9=8A =D8=A7=D9=84=D9=88=D9=82=D8=AA
=D8=A7=D9=84=D9=85=D8=AD=D8=AF=D8=AF =D9=88=D9=88=D9=81=D9=82=D9=8B=D8=A7 =
=D9=84=D9=84=D9=85=D9=8A=D8=B2=D8=A7=D9=86=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=
=D8=AD=D8=AF=D8=AF=D8=A9 =D8=A8=D8=A7=D9=84=D8=A5=D8=B6=D8=A7=D9=81=D8=A9 =
=D8=A5=D9=84=D9=89 =D8=AA=D9=84=D8=A8=D9=8A=D8=A9 =D8=AC=D9=85=D9=8A=D8=B9 =
=D8=A3=D9=87=D8=AF=D8=A7=D9=81 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9. =
=D9=85=D9=86 =D9=86=D8=A7=D8=AD=D9=8A=D8=A9
=D8=A3=D8=AE=D8=B1=D9=89=D8=8C =D9=8A=D9=85=D9=83=D9=86 =D9=84=D9=84=D9=85=
=D9=88=D8=B8=D9=81=D9=8A=D9=86 =D8=A7=D9=84=D8=A7=D8=B3=D8=AA=D9=85=D8=AA=
=D8=A7=D8=B9 =D8=A8=D9=85=D8=B1=D8=AA=D8=A8=D8=A7=D8=AA =D8=A3=D8=B9=D9=84=
=D9=89 =D9=88=D8=A8=D8=A7=D9=84=D9=85=D8=B2=D9=8A=D8=AF =D9=85=D9=86 =D9=81=
=D8=B1=D8=B5 =D8=A7=D9=84=D8=B9=D9=85=D9=84</span><span dir=3D"LTR"></span>=
<span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-fam=
ily:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"font-size:16pt;c=
olor:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B4=D9=8A=D8=B1 =D8=B4=D9=87=D8=A7=D8=AF=D8=
=A9
=D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=
=D8=B9 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span><=
span dir=3D"LTR"></span><span dir=3D"LTR"></span><span lang=3D"AR-EG" dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> </span><span=
 dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-=
spacing:0.25pt">PMP </span><span lang=3D"AR-EG" style=3D"font-size:16pt;col=
or:black;letter-spacing:0.25pt">=D8=A5=D9=84=D9=89 =D8=A3=D9=86=D9=83 =D8=
=B9=D8=B6=D9=88 =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=A8=D9=87 =D8=B9=D8=A7=D9=
=84=D9=85=D9=8A=D9=8B=D8=A7 =D9=81=D9=8A =D9=85=D8=AC=D9=85=D9=88=D8=B9=D8=
=A9 =D9=85=D9=85=D9=8A=D8=B2=D8=A9 =D9=85=D9=86 =D9=85=D8=AF=D9=8A=D8=B1=D9=
=8A =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9. =D9=83=D9=85=D8=A7 =
=D8=A3=D9=86=D9=87=D8=A7
=D8=AA=D8=B4=D9=8A=D8=B1 =D8=A5=D9=84=D9=89 =D8=A7=D9=85=D8=AA=D9=84=D8=A7=
=D9=83=D9=83 =D8=A7=D9=84=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA =D9=88=D8=A7=
=D9=84=D9=85=D8=B9=D8=B1=D9=81=D8=A9 =D8=A7=D9=84=D9=84=D8=A7=D8=B2=D9=85=
=D8=A9 =D9=84=D8=AA=D9=84=D8=A8=D9=8A=D8=A9 =D9=85=D8=AA=D8=B7=D9=84=D8=A8=
=D8=A7=D8=AA =D8=A3=D9=8A =D9=85=D8=B4=D8=B1=D9=88=D8=B9</span><span dir=3D=
"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR=
"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"fon=
t-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><b><span lang=3D"AR-SA" style=3D"font-size:16pt;color:rgb(=
148,54,52);letter-spacing:0.25pt">=D9=81=D9=88=D8=A7=D8=A6=D8=AF =D8=B4=D9=
=87=D8=A7=D8=AF=D8=A9 </span></b><b><span dir=3D"LTR" style=3D"font-size:16=
pt;font-family:SimSun;color:rgb(148,54,52);letter-spacing:0.25pt">PMP</span=
></b><span dir=3D"RTL"></span><span dir=3D"RTL"></span><b><span lang=3D"AR-=
SA" style=3D"font-size:16pt;color:rgb(148,54,52);letter-spacing:0.25pt"><sp=
an dir=3D"RTL"></span><span dir=3D"RTL"></span>:</span></b><b><span dir=3D"=
LTR" style=3D"font-size:16pt;font-family:SimSun;color:rgb(148,54,52);letter=
-spacing:0.25pt"></span></b></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D9=8A=D9=85=D9=83=D9=86 =D8=A3=D9=86 =D9=8A=D9=81=D9=
=8A=D8=AF =D8=A7=D9=84=D8=AD=D8=B5=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=B4=D9=
=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16pt;font=
-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span dir=3D"RT=
L"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:=
16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=
=3D"RTL"></span> =D8=AD=D9=8A=D8=A7=D8=AA=D9=83 =D8=A7=D9=84=D9=85=D9=87=D9=
=86=D9=8A=D8=A9
=D8=A8=D8=B9=D8=AF=D8=A9 =D8=B7=D8=B1=D9=82. =D9=8A=D9=85=D9=83=D9=86:</spa=
n></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B2=D9=8A=D8=A7=D8=AF=D8=A9 =
=D9=81=D8=B1=D8=B5=D9=83 =D9=81=D9=8A
=D8=A7=D9=84=D9=83=D8=B3=D8=A8: =D9=88=D9=81=D9=82=D9=8B=D8=A7 =D9=84=D8=A7=
=D8=B3=D8=AA=D8=A8=D9=8A=D8=A7=D9=86 =D8=B1=D9=88=D8=A7=D8=AA=D8=A8 </span>=
<span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;le=
tter-spacing:0.25pt">PMI&#39;s Earning Power</span><span dir=3D"RTL"></span=
><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;colo=
r:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"><=
/span>=D8=8C
=D9=8A=D8=AD=D8=B5=D9=84 =D8=A7=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=88=
=D9=86 =D8=A7=D9=84=D8=AD=D8=A7=D8=B5=D9=84=D9=88=D9=86 =D8=B9=D9=84=D9=89 =
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span =
dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"f=
ont-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><=
span dir=3D"RTL"></span> =D8=B9=D9=84=D9=89 =D8=B1=D8=A7=D8=AA=D8=A8 =D8=A3=
=D8=B9=D9=84=D9=89
=D9=85=D9=86 =D8=A7=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=8A=D9=86 =D8=BA=
=D9=8A=D8=B1 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF=D9=8A=D9=86.</span>=
</p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B9=D8=B2=D8=B2 =D9=85=D8=B5=
=D8=AF=D8=A7=D9=82=D9=8A=D8=AA=D9=83:
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span =
dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"f=
ont-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><=
span dir=3D"RTL"></span> =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=A8=D9=87=D8=A7 =
=D9=88=D9=85=D8=AD=D8=AA=D8=B1=D9=85=D8=A9 =D8=B9=D8=A7=D9=84=D9=85=D9=8A=
=D9=8B=D8=A7=D8=8C =D9=88=D9=87=D9=8A =D8=AA=D9=88=D8=B6=D8=AD =D8=A7=D9=84=
=D8=AA=D8=B2=D8=A7=D9=85=D9=83 =D8=A8=D9=85=D9=87=D9=86=D8=A9 =D8=A5=D8=AF=
=D8=A7=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9.</span></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D9=81=D8=AA=D8=AD =D9=81=D8=B1=
=D8=B5 =D9=88=D8=B8=D9=8A=D9=81=D9=8A=D8=A9:
=D8=AA=D8=AA=D8=B7=D9=84=D8=A8 =D8=A7=D9=84=D8=B9=D8=AF=D9=8A=D8=AF =D9=85=
=D9=86 =D8=A7=D9=84=D9=85=D8=A4=D8=B3=D8=B3=D8=A7=D8=AA =D8=B4=D9=87=D8=A7=
=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:S=
imSun;color:black;letter-spacing:0.25pt">PMP</span><span dir=3D"RTL"></span=
><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;colo=
r:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"><=
/span> =D8=A3=D9=88 =D8=AA=D9=81=D8=B6=D9=84=D9=87=D8=A7 =D9=84=D8=B4=D8=BA=
=D9=84
=D9=85=D9=86=D8=A7=D8=B5=D8=A8 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=
=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9=D8=8C =D9=88=D9=8A=D9=85=D9=83=D9=86 =
=D8=A3=D9=86 =D9=8A=D8=B3=D8=A7=D8=B9=D8=AF=D9=83 =D8=A7=D9=84=D8=AD=D8=B5=
=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =
=D9=81=D9=8A =D8=A7=D9=84=D8=AA=D9=85=D9=8A=D8=B2 =D9=81=D9=8A =D8=B3=D9=88=
=D9=82 =D8=B9=D9=85=D9=84
=D8=AA=D9=86=D8=A7=D9=81=D8=B3=D9=8A.</span></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=AA=D8=AD=D8=B3=D9=8A=D9=86 =
=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA=D9=83 =D9=81=D9=8A
=D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=
=D8=B9: =D9=8A=D8=AA=D8=B7=D9=84=D8=A8 =D8=A7=D9=84=D8=AA=D8=AD=D8=B6=D9=8A=
=D8=B1 =D9=84=D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86 </span><span dir=3D"LTR" =
style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25p=
t">PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=
=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"><span=
 dir=3D"RTL"></span><span dir=3D"RTL"></span> =D9=81=D9=87=D9=85=D8=A7=D9=
=8B =D8=B9=D9=85=D9=8A=D9=82=D8=A7=D9=8B
=D9=84=D9=85=D8=A8=D8=A7=D8=AF=D8=A6 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=
=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=88=D8=A3=D9=81=D8=B6=D9=84 =
=D8=A7=D9=84=D9=85=D9=85=D8=A7=D8=B1=D8=B3=D8=A7=D8=AA=D8=8C =D9=88=D8=A7=
=D9=84=D8=AA=D9=8A =D9=8A=D9=85=D9=83=D9=86 =D8=A3=D9=86 =D8=AA=D8=AD=D8=B3=
=D9=86 =D9=82=D8=AF=D8=B1=D8=AA=D9=83 =D8=B9=D9=84=D9=89 =D8=A5=D8=AF=D8=A7=
=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D8=A8=D9=81=D8=B9=D8=A7=
=D9=84=D9=8A=D8=A9.</span><span dir=3D"LTR" style=3D"font-size:16pt;font-fa=
mily:SimSun;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:rgb(148=
,54,52);letter-spacing:0.25pt">=D8=A7=D9=84=D8=A3=D9=87=D8=AF=D8=A7=D9=81 =
=D8=A7=D9=84=D8=AA=D9=81=D8=B5=D9=8A=D9=84=D9=8A=D8=A9 =D9=84=D9=84=D8=A8=
=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=
=D9=8A =D9=84=D9=84=D8=AD=D8=B5=D9=88=D9=84 =D8=B9=D9=84=D9=89
=D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=A7=D8=AF=D8=
=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=
=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=8A=D8=B3=D8=A7=D8=
=B9=D8=AF =D9=85=D8=AF=D9=8A=D8=B1=D9=8A
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=A8=D8=A7=D9=84=
=D9=85=D8=A4=D8=B3=D8=B3=D8=A7=D8=AA =D9=88=D8=A7=D9=84=D8=B4=D8=B1=D9=83=
=D8=A7=D8=AA =D9=84=D9=84=D8=AA=D8=B9=D8=B1=D9=81 =D8=B9=D9=84=D9=8A =D8=A7=
=D9=84=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA =D8=A7=D9=84=D8=B9=D9=84=D9=85=
=D9=8A=D8=A9 =D9=88=D8=A7=D9=84=D8=AA=D8=B7=D8=A8=D9=8A=D9=82=D9=8A=D8=A9 =
=D9=88=D8=A7=D9=84=D9=81=D9=86=D9=8A=D8=A9
=D8=A7=D9=84=D9=84=D8=A7=D8=B2=D9=85=D8=A9 =D9=84=D8=A7=D8=AF=D8=A7=D8=B1=
=D8=A9 =D8=A7=D9=8A =D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D8=A8=D9=86=D8=AC=D8=A7=
=D8=AD =D9=88=D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D8=AE=D8=B7=
=D9=8A=D8=B7 =D8=A7=D9=84=D8=AC=D9=8A=D8=AF =D9=84=D9=84=D8=A7=D8=B9=D9=85=
=D8=A7=D9=84 =D8=A7=D9=84=D8=B0=D9=8A =D9=8A=D8=B3=D8=A7=D8=B9=D8=AF =D8=A7=
=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9
=D8=B9=D9=84=D9=8A =D8=A7=D9=84=D8=B1=D8=A8=D9=8A=D8=AD=D9=8A=D8=A9 =D9=88=
=D8=A7=D9=84=D9=86=D8=AC=D8=A7=D8=AD =D8=8C =D9=83=D9=85=D8=A7 =D8=A7=D9=86=
=D9=87 =D9=8A=D8=B9=D8=AF =D8=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=AA=D8=AF=
=D8=B1=D9=8A=D8=A8=D9=8A =D9=85=D8=AA=D9=88=D8=A7=D9=81=D9=82 =D9=85=D8=B9 =
=D9=85=D9=86=D9=87=D8=AC=D9=8A=D8=A9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D9=88=D9=81=D9=82=
=D8=A7=D9=8B =D9=84=D9=85=D8=B9=D9=87=D8=AF =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=A7=D9=84=D8=A7=
=D9=85=D8=B1=D9=8A=D9=83=D9=8A</span><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;co=
lor:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"=
></span> PMI . </span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:bl=
ack;letter-spacing:0.25pt">=D9=87=D8=B0=D8=A7 =D8=A7=D9=84=D8=A8=D8=B1=D9=
=86=D8=A7=D9=85=D8=AC =D9=8A=D9=88=D9=81=D8=B1
=D9=84=D9=83 =D8=A7=D9=84=D9=81=D8=B1=D8=B5=D8=A9 =D9=84=D9=84=D8=AD=D8=B5=
=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span><span =
dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font=
-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-SA" s=
tyle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=A7=D9=84=D8=
=AF=D9=88=D9=84=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF=D8=
=A9
=D9=85=D9=86 =D8=AE=D9=84=D8=A7=D9=84 =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=
=D8=A8 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A =D9=88=D8=A7=
=D9=84=D9=85=D8=AA=D9=85=D9=8A=D8=B2 =D9=88=D8=A7=D9=84=D8=B0=D9=8A =D9=8A=
=D8=A4=D9=87=D9=84=D9=83 =D9=84=D9=84=D8=AA=D9=82=D8=AF=D9=85 =D8=A7=D9=84=
=D9=89 =D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86 =D8=A7=D9=84=D9=85=D8=B9=D9=87=
=D8=AF
=D8=A7=D9=84=D8=A7=D9=85=D8=B1=D9=8A=D9=83=D9=8A =D9=84=D8=A7=D8=AF=D8=A7=
=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9</span><span d=
ir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-=
size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span> PMI </span><span lang=3D"AR-SA" s=
tyle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=88=D9=81=D9=
=82=D8=A7 =D9=84=D8=B4=D8=B1=D9=88=D8=B7 =D8=A7=D9=84=D9=85=D8=B9=D9=87=D8=
=AF</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LT=
R" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.=
25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span lang=
=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"></spa=
n></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=BA=D8=B7=D9=8A=D8=A9 =D9=85=D8=B9=D8=B1=D9=
=81=D9=8A=D8=A9 =D8=B4=D8=A7=D9=85=D9=84=D8=A9 =D9=84=D9=83=D9=84 =D9=85=D9=
=88=D8=A7=D8=B6=D9=8A=D8=B9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=
=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA</span><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:=
SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span di=
r=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"font-size:16pt;color=
:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D8=AA=D8=B9=D8=B1=D9=81 =D8=B9=D9=84=D9=
=89 =D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=AA=D8=AD=D8=AF=D9=8A=D8=AF =D8=A7=D9=
=84=D8=A3=D8=B9=D9=85=D8=A7=D9=84 =D8=A7=D9=84=D8=AE=D8=A7=D8=B5=D8=A9 =D8=
=A8=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D9=88=D8=AA=D9=83=D9=88=D9=
=8A=D9=86 =D9=81=D8=B1=D9=82 =D8=A7=D9=84=D8=B9=D9=85=D9=84</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"=
font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D9=85=D9=85=D8=A7=D8=B1=D8=B3=D8=A9 =D8=
=A7=D9=84=D8=B9=D9=85=D9=84=D9=8A=D8=A9 =D9=84=D9=85=D8=B1=D8=A7=D9=82=D8=
=A8=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D9=88=D8=B6=D8=A8=D8=
=B7=D9=87</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span=
 lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D8=AA=D8=B7=D8=A8=D9=8A=D9=82 =D8=A7=D9=
=84=D8=B9=D9=85=D9=84=D9=8A =D9=84=D9=84=D8=AA=D8=AE=D8=B7=D9=8A=D8=B7 =D8=
=A7=D9=84=D8=B2=D9=85=D9=86=D9=8A =D9=88=D8=A7=D9=84=D9=85=D8=A7=D9=84=D9=
=8A =D9=84=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"=
font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=BA=D8=B7=D9=8A=D8=A9 =D9=83=D9=84 =D9=85=D9=
=88=D8=A7=D8=B6=D9=8A=D8=B9 =D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86</span><spa=
n dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"fo=
nt-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span di=
r=3D"LTR"></span><span dir=3D"LTR"></span> (PMP) </span><span lang=3D"AR-SA=
" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=A7=D9=84=
=D8=AA=D9=8A =D8=AA=D9=85=D9=83=D9=86 =D8=A7=D9=84=D9=85=D8=AA=D8=AF=D8=B1=
=D8=A8
=D9=85=D9=86 =D8=A7=D8=AC=D8=AA=D9=8A=D8=A7=D8=B2 =D8=A7=D9=84=D8=A7=D9=85=
=D8=AA=D8=AD=D8=A7=D9=86</span><span dir=3D"LTR"></span><span dir=3D"LTR"><=
/span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:bl=
ack;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></spa=
n>.</span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-s=
pacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B7=D8=A8=D9=8A=D9=82 =D9=85=D9=87=D8=A7=D8=
=B1=D8=A7=D8=AA =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=
=A7=D8=B1=D9=8A=D8=B9 =D9=88=D8=A7=D9=84=D8=A3=D8=AF=D9=88=D8=A7=D8=AA =D9=
=88=D8=A7=D9=84=D8=AA=D9=82=D9=86=D9=8A=D8=A7=D8=AA =D9=84=D8=AA=D8=B3=D9=
=84=D9=8A=D9=85 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=81=D9=
=8A =D8=A7=D9=84=D9=88=D9=82=D8=AA
=D8=A7=D9=84=D9=85=D8=AD=D8=AF=D8=AF =D9=88=D9=81=D9=8A =D8=AD=D8=AF=D9=88=
=D8=AF =D8=A7=D9=84=D9=85=D9=8A=D8=B2=D8=A7=D9=86=D9=8A=D8=A9</span><span d=
ir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-=
size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=B4=D8=B1=D8=AD =D9=83=D8=A7=D9=85=D9=84 =D8=A7=D9=
=84=D9=85=D9=86=D9=87=D8=AC =D8=A8=D8=B7=D8=B1=D9=8A=D9=82=D8=A9 =D8=B3=D9=
=87=D9=84=D8=A9 =D9=88=D8=A8=D8=B3=D9=8A=D8=B7=D8=A9 =D9=88=D8=B4=D9=8A=D9=
=82=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span=
 lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B7=D8=A8=D9=8A=D9=82=D8=A7=D8=AA =D8=B9=D9=
=85=D9=84=D9=8A=D8=A9 =D8=A8=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =D8=
=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC</span><span dir=3D"LTR"></span><span dir=
=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSu=
n;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span> Microsoft Project.</span><span lang=3D"AR-SA" style=3D"font-si=
ze:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =D9=83=D8=
=AA=D8=A7=D8=A8 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=
=A7=D8=B1=D9=8A=D8=B9 =D8=A7=D9=84=D9=85=D8=B9=D8=B1=D9=81=D9=8A=D8=A9 &quo=
t;</span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color=
:black;letter-spacing:0.25pt">PMBOK</span><span dir=3D"RTL"></span><span di=
r=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"></span>
=E2=80=93 =D8=A7=D9=84=D8=A5=D8=B5=D8=AF=D8=A7=D8=B1=D8=A7=D9=84=D8=B3=D8=
=A7=D8=AF=D8=B3 =D9=88=D8=A7=D9=84=D8=A7=D8=B5=D8=AF=D8=A7=D8=B1 =D8=A7=D9=
=84=D8=B3=D8=A7=D8=A8=D8=B9&quot; =D9=88=D8=AF=D9=84=D9=8A=D9=84 =D9=85=D9=
=85=D8=A7=D8=B1=D8=B3=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16p=
t;font-family:SimSun;color:black;letter-spacing:0.25pt">Agile</span><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"fo=
nt-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><s=
pan dir=3D"RTL"></span>
=D9=88=D9=81=D9=87=D9=85 =D9=85=D8=AA=D8=B7=D9=84=D8=A8=D8=A7=D8=AA =D8=B4=
=D9=87=D8=A7=D8=AF=D8=A9 =D8=A7=D8=AE=D8=AA=D8=A8=D8=A7=D8=B1 </span><span =
dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-s=
pacing:0.25pt">PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span>=
<span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.2=
5pt"><span dir=3D"RTL"></span><span dir=3D"RTL"></span> =D9=88=D9=86=D8=B5=
=D8=A7=D8=A6=D8=AD =D9=84=D8=A7=D8=AC=D8=AA=D9=8A=D8=A7=D8=B2
=D8=A7=D9=84=D8=A7=D8=AE=D8=AA=D8=A8=D8=A7=D8=B1</span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;background-image=
:initial;background-position:initial;background-size:initial;background-rep=
eat:initial;background-origin:initial;background-clip:initial;direction:rtl=
;unicode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-fa=
mily:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" st=
yle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=84=D9=84=D8=AA=
=D8=B3=D8=AC=D9=8A=D9=84 =D9=88=D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=
=D9=83 =D9=81=D9=8A =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A7=D8=AA =D8=A7=
=D9=84=D9=85=D9=87=D9=86=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=
=D8=AF=D8=A9</span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:Si=
mSun;color:black;letter-spacing:0.25pt"></span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" st=
yle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=86=D8=B4=D9=83=
=D8=B1=D9=83 =D8=B9=D9=84=D9=89 =D8=AB=D9=82=D8=AA=D9=83 =D8=A7=D9=84=D8=BA=
=D8=A7=D9=84=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D9=89 =D9=86=D8=B9=D8=AA=D8=B2 =
=D8=A8=D9=87=D8=A7 =D9=81=D9=89 =D8=A8=D8=AF=D8=A7=D9=8A=D8=A9 =D8=AA=D8=B9=
=D8=A7=D9=88=D9=86 =D9=85=D8=AB=D9=85=D8=B1 =D9=88 =D8=A8=D9=86=D8=A7=D8=A1=
 =D8=A5=D9=86 =D8=B4=D8=A7=D8=A1
=D8=A7=D9=84=D9=84=D9=87, =D9=88=D9=8A=D9=85=D9=83=D9=86=D9=83 =D8=A7=D9=84=
=D8=A5=D8=B4=D8=AA=D8=B1=D8=A7=D9=83 =D9=88=D8=A7=D9=84=D8=AA=D8=B3=D8=AC=
=D9=8A=D9=84 =D9=83=D8=A7=D9=84=D8=A2=D8=AA=D9=8A</span></b><span dir=3D"LT=
R"></span><span dir=3D"LTR"></span><b><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR=
"></span><span dir=3D"LTR"></span>:</span></b><span dir=3D"LTR" style=3D"fo=
nt-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"></span><=
/p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=AA=D9=80=D8=A3=D9=
=83=D9=80=D9=8A=D8=AF =D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=D9=83</spa=
n><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=
=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><s=
pan dir=3D"LTR"></span><span dir=3D"LTR"></span> :</span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=8A=D8=AA=D9=85 =
=D8=AA=D8=A3=D9=83=D9=8A=D8=AF =D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=
=D9=83 =D8=A8=D8=B9=D8=AF =D8=B3=D8=AF=D8=A7=D8=AF =D8=B1=D8=B3=D9=88=D9=85=
 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D8=B3=D9=88=D8=A7=D8=A1 =D9=86=
=D9=82=D8=AF=D8=A7 =D8=A3=D9=88 =D8=A8=D8=B4=D9=8A=D9=83 =D8=A3=D9=88 =D8=
=A8=D8=A7=D9=84=D8=AA=D8=AD=D9=88=D9=8A=D9=84
=D8=A7=D9=84=D8=A8=D9=86=D9=83=D9=8A</span><span dir=3D"LTR"></span><span d=
ir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:Sim=
Sun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=
=3D"LTR"></span>.</span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:15pt 0in 7.5pt;text=
-align:center;background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:18pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(53,53,53)">=D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D8=B3=
=D8=AC=D9=8A=D9=84
=D9=88=D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=D9=83</span><span dir=3D"L=
TR"></span><span dir=3D"LTR"></span><span style=3D"font-size:18pt;font-fami=
ly:Arial,&quot;sans-serif&quot;;color:rgb(53,53,53)"><span dir=3D"LTR"></sp=
an><span dir=3D"LTR"></span>:</span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in 0in 7.5pt;text-=
align:center;background-image:initial;background-position:initial;backgroun=
d-size:initial;background-repeat:initial;background-origin:initial;backgrou=
nd-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(148,54,52)">=D8=B3=D8=A7=D8=B1=D8=A9 =D8=B9=D8=A8=D8=AF =D8=A7=D9=
=84=D8=AC=D9=88=D8=A7=D8=AF</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in 0in 7.5pt;text-=
align:center;background-image:initial;background-position:initial;backgroun=
d-size:initial;background-repeat:initial;background-origin:initial;backgrou=
nd-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(148,54,52)">00201062992510 / 00201096841626</span></b><b><span sty=
le=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;color:rgb(148=
,54,52)"></span></b></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=C2=A0</span></p>

<p dir=3D"RTL" style=3D"margin:0in 0in 15pt;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:e=
mbed;font-size:12pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quo=
t;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:rgb(23,54,93);letter=
-spacing:0.25pt">=C2=A0</span></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><span dir=3D"LTR" style=3D"font-size:9pt;font-fami=
ly:SimSun">=C2=A0</span></p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKu3oWPQypb6cDPLYo4SVcqokmXE00jM04JdOJBggMpS3uZYa=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAKu3oWPQypb6cDPLYo4SVcqokmXE00jM04JdOJBggM=
pS3uZYaQ%40mail.gmail.com</a>.<br />

--0000000000002d61ab0602228859--
