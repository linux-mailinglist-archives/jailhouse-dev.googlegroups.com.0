Return-Path: <jailhouse-dev+bncBC2JJ3WLUUMBBF5BXL7AKGQEBASS6FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F452D1A82
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 21:29:12 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id a23sf5090057lji.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Dec 2020 12:29:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607372952; cv=pass;
        d=google.com; s=arc-20160816;
        b=pZ+gjrvlWRoNgIpPn0Ej2j3xHpV7Kq+qNcVH89o/rNAaX3TjwbWiRcsGVD5BdkS3Xw
         r3L6l9PNfgBHHkASbQMla8CUUr3jOpKoin3pwv9m0BIOMnufsxE4mUpOJ697U9ttAgK0
         omrtXxhSypjOaL+MDOP0AaZbV/pzxhXFZsMjoGVP5BdG1w+eK5QCgItG7gCD2x+UjwXU
         hmGT+ELnaDF6AgMq4f8QklM7o6ttYLgl+JYql11RKuWj47h2gV+cDcskQxVN0w19GdFW
         Wcvoz3Jt7Kly9319Jm6WBqGgXEe8gnCI73bQLfDKVPNxQ0E6zjlsCXcvjyp3oIhK6ELR
         jDHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:to:mime-version:user-agent:date:message-id:subject
         :from:sender:dkim-signature;
        bh=Y6smVH39UvQ10Vle1d4ua/WJclFmazg+b6wVLLokiFM=;
        b=qoA00D+sfX3BgSmsLw/49qkDJDVpGV8SNvgJQigpCtGLCZLx54UBHFLl7UO9kOquFM
         pvv7PCPtDDg6L1OkSS06wyVt8HcV1yLqEC46JF1Rz29DBgHK4rhLk/qWP5Pz9YF6RD45
         hZh5F9k8FOZIfpc+IuTS8/YuQ/Hw6IRqPql4o/n+Zwh8l3emiK4ffpbaAKNdrnBut/k4
         h9sbm8BMZ5h86r3XO4ZzUsNPdfDUeUrV8cz2lmAYByZNwFlfTdesYBWdaJwEvws+DOaL
         4QhDNUQ1RRPDrb8GNvowtD2vx6a9ukTX6r3CgJJ++Y0hV+rT1ZgB90Cu1MJJzEHDovXE
         FoSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@fridu.net header.s=google header.b="Tz+/SUWo";
       spf=pass (google.com: domain of dominig.arfoll@fridu.net designates 2a00:1450:4864:20::430 as permitted sender) smtp.mailfrom=dominig.arfoll@fridu.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:message-id:date:user-agent:mime-version:to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y6smVH39UvQ10Vle1d4ua/WJclFmazg+b6wVLLokiFM=;
        b=rl8njdNtJ5etKLe6P2OpjwZS4fu2lv9luDTyNMJptJikIAPbUtT8aZvzPKsriCFpqf
         vwGf1Kof7YGGKUnVa6eUQPwEFwC5QnegYm8epPZN2eoZ1K/dONHJiP+Ovmf3lveYTREu
         1wp6ECxSIz7Ljc9eLFXiV1V7rW3TWmaeCnRfgTdnC9j/EojfDvWZ5vKFnJp3T47UEsT/
         Mfd3wai5HaW5nnatpTFuvE7e2ZNo5NQbgt/gSdgAWB0VaZOwMswbVC4tSqTEi1Xrlhaz
         jOHP8rU7KXPW3TT1knyKlJ1iQnp9GG55Y/E+BB7GtNV87Peam/DZZqXLndzzuv35senk
         TK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:message-id:date:user-agent
         :mime-version:to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Y6smVH39UvQ10Vle1d4ua/WJclFmazg+b6wVLLokiFM=;
        b=AyplCucP8fTRRgjB5wbQpHcMHHm6r1DykJ0Son9dheOUI9R17Mv4wMjnIx224YY4Sc
         OK4YXTUHraFSaqONch56zxPehF4PxClmeMpwV6CE7S63lxjBLgfGc5jEOTxcMb8WmMOQ
         P/2OQPABtYt/ZxIPGg2fKiQXTBXAn4JMflI/fheTgGSR/LljV/ZLcuIjojmKENAxpps9
         MuY/AwYv1MEQsTb76yOqZFdNBacqjhE2aKAAZietKG4tTlRVBKo3FZYprQ7sN4sGjR67
         fi//LGNCXEFhFFoMvYRCBB/5/+L25agJpEcwotw9j7vo1SPw1RUtyIzpM9CKFqq6E3NY
         Pn9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JPdlO1/BYSGG3IyjFG94zF8KgP58u34Un4yoe4UHpkyQJx2Fe
	2X5WirwO/Ksm8gxb+Q4czbo=
X-Google-Smtp-Source: ABdhPJxXZQlfUM3QwP+ZemjN6kuUmJ7ey8YExplsfLhVqKB6f/RgZxPki5UVHrLHBhwg8NT/mD/sfg==
X-Received: by 2002:ac2:5e67:: with SMTP id a7mr3548115lfr.406.1607372952149;
        Mon, 07 Dec 2020 12:29:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc2a:: with SMTP id b42ls3006908ljf.2.gmail; Mon, 07 Dec
 2020 12:29:11 -0800 (PST)
X-Received: by 2002:a2e:7c0a:: with SMTP id x10mr9699624ljc.119.1607372951056;
        Mon, 07 Dec 2020 12:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607372951; cv=none;
        d=google.com; s=arc-20160816;
        b=WxpAzUbcDOBATdiGJpomFnwdOAHTMyagt68cP5BwEh2u+OGMJgwYKYOcs1TOdhXKWg
         LEto3EJgVy/xEjguDDqzdgMJv9yDWRq73I6lOvVGGZyLoE8KQb5ak6I18EPDFPEe8jg/
         +CyQXohSqBokXIWeIihMhqk/4aHOAIBoWR0ZuRywnPn9tha5UnvVh9Ph11fDctOF4RVi
         nNfHOpBzr6XqDPa0LDDAHRPlYtk4lM6A0uCjPf3ymNBieGsVXV4QSV2DoAgji6peJL3y
         uTF30n1r9BR0nkYNZdOYL7gyJzV0dcUTUE5SydvYvdqfwktbryDFK+x/YVRJcTSf7o84
         W7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:to:mime-version
         :user-agent:date:message-id:subject:from:dkim-signature;
        bh=un2xjWh8G1abgYjh+rHybh4Ftcwn5GB0Yq64iSJw6tY=;
        b=sR6t56IRbyFsIBuYnc/rQFYqMOuutI+8PrTXt/N+0ib5EavJp6omiLBYZvMrzomJlv
         OSsZRhZxdcGtUVFvRPJdop0tbB4ZpKHGn4DxKhDLpv8ys72E376fUsjehNoibqMlZsY1
         2IiQE0Wftu/D5fFNP2+OuaFicb106VJi0KhVBJkAHNepfffmRMa/rCjmatwxZy4E+TDR
         cft3WqZ3KVNjccPVbLmGMb+zSTG9MdwDXwVi5rLC9Nngap9FY9fdXK5/lW3MxJBtWDqT
         MkBp1oJjC6Y8RnOy+R/vXiv2uAq97egiyiqIoGW1z2XqrmAgOhtMfaKJVNQt6T+30RY+
         /IOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@fridu.net header.s=google header.b="Tz+/SUWo";
       spf=pass (google.com: domain of dominig.arfoll@fridu.net designates 2a00:1450:4864:20::430 as permitted sender) smtp.mailfrom=dominig.arfoll@fridu.net
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com. [2a00:1450:4864:20::430])
        by gmr-mx.google.com with ESMTPS id r12si75413ljm.1.2020.12.07.12.29.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 12:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of dominig.arfoll@fridu.net designates 2a00:1450:4864:20::430 as permitted sender) client-ip=2a00:1450:4864:20::430;
Received: by mail-wr1-x430.google.com with SMTP id r3so14067376wrt.2
        for <jailhouse-dev@googlegroups.com>; Mon, 07 Dec 2020 12:29:10 -0800 (PST)
X-Received: by 2002:adf:ed46:: with SMTP id u6mr21308555wro.287.1607372950330;
        Mon, 07 Dec 2020 12:29:10 -0800 (PST)
Received: from [10.0.0.103] (136.163.162.46.arpa.wibox.fr. [46.162.163.136])
        by smtp.gmail.com with ESMTPSA id v64sm454877wme.25.2020.12.07.12.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 12:29:09 -0800 (PST)
From: "Dominig ar Foll (Intel Open Source)" <dominig.arfoll@fridu.net>
Subject: IoT Long Term support Linux - Opening to the community of Redpesk@SEA
 the open source "Marine Grade Linux" by IoT.bzh.
Message-ID: <83685f06-558c-5307-6087-306ce0f01baf@fridu.net>
Date: Mon, 7 Dec 2020 21:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
To: undisclosed-recipients: ;
Content-Type: text/html; charset="UTF-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: dominig.arfoll@fridu.net
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@fridu.net header.s=google header.b="Tz+/SUWo";       spf=pass
 (google.com: domain of dominig.arfoll@fridu.net designates
 2a00:1450:4864:20::430 as permitted sender) smtp.mailfrom=dominig.arfoll@fridu.net
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

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <i><font color=3D"#5f5555">Hello,<br>
        As Marine requirement is very very close of any IoT (very) long
        term Linux requirement with high level of security and
        application isolation, I thought that this webinar from the
        Linux Fundation might be of interest to some of you...</font></i>
    <ul>
      <li><i><font color=3D"#5f5555"></font></i>The 16th december 17:00
        (CET)<br>
      </li>
      <li>Free Registration <a class=3D"moz-txt-link-freetext"
href=3D"https://www.automotivelinux.org/event/agl-member-webinar-aglsea-a-m=
arine-grade-linux/">https://www.automotivelinux.org/event/agl-member-webina=
r-aglsea-a-marine-grade-linux/</a></li>
    </ul>
    <p><i><font color=3D"#5f5555">The Marine Grade Linux project by
          IoT.bzh addresses smart ship provides a customized flavor of
          AGL that addresses marine specific requirements. For
          signaling, NMEA2000, CanOpen, Ethercat and Modbus were added.
          Cloud connectivity is designed to handle random connectivity
          with a balance of 4/5G and satellite data link. Some core
          marine services as nautical charts, safe routing, or radar are
          still under development and should be added in the near
          future. Last but not least, a 30 years old ship is pretty
          common and maintenance/update on 15 years is required. <br>
        </font></i></p>
    <p><i><font color=3D"#5f5555">This presentation exposes the outcome of
          the three marine projects IoT.bzh is currently developing for
          this industry. It starts exposing gaps in business models,
          then exposes some of the technical specificities (signaling,
          SOTA, LTS, =E2=80=A6). Finally it introduces redpesk@sea the
          ready-to-use =E2=80=9CMarine Grade Linux=E2=80=9D version that Io=
T.bzh will
          propose as Christmas gift to the maritime open-source
          community. </font></i> </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Dominig ar Foll
Senior Software Architect</pre>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/83685f06-558c-5307-6087-306ce0f01baf%40fridu.net?u=
tm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/ja=
ilhouse-dev/83685f06-558c-5307-6087-306ce0f01baf%40fridu.net</a>.<br />
