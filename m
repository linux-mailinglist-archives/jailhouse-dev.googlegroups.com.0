Return-Path: <jailhouse-dev+bncBDIO7H5HXQBBBNXM62BQMGQE67HQNZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42136489B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 18:56:23 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id f7-20020a5b0c070000b02904e9a56ee7e7sf8328128ybq.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 09:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618851383; cv=pass;
        d=google.com; s=arc-20160816;
        b=bZYqNiEfdvCrVBZBdNwTZqYqEFjsMDGn0D2n0AKnDFnEksawx9RVNa4rvqxhzxDqIR
         7V5jKaBjB9+6fj5XbEyH4ZpwvI5H76Z70Kk9N9YlCKxemg01ec7Y0o5T7KXm+acmWp1U
         3OYlZaiWILmTxxh9ozCaF4QoFmYIGhTdr7GbLOMCGxGfa/RrpgY1KVgwZD0XfbHbYvAC
         TB2GON8iws4v1gci+Jw6LcMAw4EJ4u/vHjZH9i7gsxDR6pR0uKDtcj3FwmKtlU3dWrc5
         dPIIXb7Eyj5EFfoFsBugrBmbD3+6LlMUVUDAJlYJRQQtsy1F+NALPDVM23t5KTwDzpIe
         ujSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:list-unsubscribe:subject:message-id:to
         :reply-to:mime-version:from:date:sender:dkim-signature;
        bh=LNypn0nGeQ2ytBZTFrFZ7T8G76KbaFYk52vG2bHsWWk=;
        b=m3wLEPyQjezVvx4R8U7fvmo2CV5F7pc81lQDlzK4h7zLpHo/pm6SBuajEyz4w3v/pE
         85p0ov7iu81loxhVk6vjZBsvhaUWhyQc/GLgKmT1eaA8Z3esbPHoTqif2zkvF5Wnkvec
         WA4bxLtwG37D2YkdLWPrHU18v6NC/tgdZMymsRp4yQU71wa2tXatUeJ5eWSHDTIq0eoo
         tLQA3PknLbpGTdB6A30pjKOZXvD8y920rD9mT5NLqdM60JdYyLxKhLRKtxnOqxfl9lwQ
         5Y7kBDunqOhMg0R1L/kv4sB+Mk3jlwlKn7F4LA6KmdRe/FOM1iFlGAsbANk8hXcIc+rW
         iPhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=y3J+rele;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.181.178 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:mime-version:reply-to:to:message-id:subject
         :list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=LNypn0nGeQ2ytBZTFrFZ7T8G76KbaFYk52vG2bHsWWk=;
        b=bM7xD1NPwnAYp1OucsWGhjHAkZq2sZcF/fnCxd3aTcP2MhUNWQVqWzb7tEPsUufgxk
         ChOv7n5HqNhaZ5tCwTH+oP1EYc/+6/VsD8DR7RQ/k6mqHhx2Ta8IX4rLRVZvVHMpqM4W
         WC2Ajy+gxlyISDA3loA5t2gaLcuZ/9OroFrHz1e3vZYwY1Jmvam/AAz4CUAjtZJVNjmp
         szhOdnn9Z4Ag6RKTuoIFCsXOvwVHyF4LCmjXX3Vpz56lz9DHtupS3TIyM8qWDl7sMIrS
         YXvSU0zxMwdG1fGPp0VK/p3joAiSqS8efWy1bRmaHAB1DMsantHTDq9PkmJ2PPW9G2BX
         kKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:mime-version:reply-to:to
         :message-id:subject:list-unsubscribe:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=LNypn0nGeQ2ytBZTFrFZ7T8G76KbaFYk52vG2bHsWWk=;
        b=dmsTXu62xz2LbAiAw3BIOmuj9cWLFo8Vs+LGbu8Z2PXGMhvu7h10idQfgIkiSH1IGh
         KBrAKe7kf7Dq16GJkmEcfXidkKVB+7GYUpKiso91X0aj6ZkIs8k3i1FTpBsv+ziJJlXs
         W1SNrECCPJlksWBAyfAxzpUoZdKAzQFv4UJnPnO5QIzVFZ7koDw6hpjXYTErrrILOgQ+
         cu6UgepB4W8Gat9r17VDzo/RAxskGDVkF+zI0aufo8UXoRh3mJuo9npTNLjD+qSrbpLb
         R0K6iHZmoC/4c++GM6tJTVsC/jJZz3s+0oOGd6Tp962zN8DE+34oC47drByHTWu/hxpJ
         bHrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Aj9BTATXKSFV85PV3Cs2/pa9mfvmTSiJotleGza5ZdgdE462t
	PHvvmkWaBvxVSen7OKZt4So=
X-Google-Smtp-Source: ABdhPJybEI7asXC18C2xJxV9BIjSGj3paVYfXPbixGC4EsZBu/tUs+Vv4GZE91cfw7pxmwBqSw64Kw==
X-Received: by 2002:a05:6902:68a:: with SMTP id i10mr18362819ybt.0.1618851382827;
        Mon, 19 Apr 2021 09:56:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7bc7:: with SMTP id w190ls5367696ybc.2.gmail; Mon, 19
 Apr 2021 09:56:22 -0700 (PDT)
X-Received: by 2002:a25:2a0d:: with SMTP id q13mr18601547ybq.10.1618851382305;
        Mon, 19 Apr 2021 09:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618851382; cv=none;
        d=google.com; s=arc-20160816;
        b=tVXYJKXVk26XXIe51f2Rriw1IMXy8E5WpKkVReWkYXsEOOigpJWQ1twG9cSTL9AmH2
         5c66LaY+OwIIicCH46Qp4YZuY/ypl0QrHoiwlitvne5l9JvcWhX3vJdFn6hsuKXpTut4
         4gloLTFjPVPXjyYCc3r0FI7n802FnVLKhLX0uuk90WS98OwhR6T9suno3SwDMU8tXjgA
         1U4U2m0Q3KZsFN89i6BLDMm01TM9d2lf2wHYSTTLOJ1Lu7QyK1rXdgJF0tw6X9Y0QCdZ
         Wv62vZZDAJnoYFkMMRmGm43t2/U0eV9lNVd8YlPHRhFFkufToJDd0sn4hwJT/qX5h85Q
         XJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:subject:message-id:to:reply-to:mime-version:from
         :date:dkim-signature;
        bh=MOvUPvpzl/MyX1jLQGxUCjdTEuhIQjj+TAyQCuODMNM=;
        b=UUYAf2p9GwqIzGY6EC1cQis1uVCylIesiDZAHbvfXiWasnLTj/SpKJHxboHux1VKdS
         jlyZa7pNZ78TS8eunaOvtXbpc6qTaNNnR8AuxTRns4tfJer/W+01jXNu/v7gWCPCpfpK
         E6iy5rQUHPFAW6Ri5RaR0e5H3o3cDXCcwjwpMUh2HCF9FN2XB0XHBAaTtAD/1d6NBTHj
         hh/XOz40qBRzViCtSB9jNGb9NmzMxznpOwMG0PL+s10wj2HMHXOe0oLVM++l36RiXOdY
         8KJlOA8bQ2Xpkd5uYi0h9j2Oj5zKM6JinJ0ilNsAtmYKxQZr5L+BK9lhDYoC1a+LceGB
         wedg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@sendgrid.net header.s=smtpapi header.b=y3J+rele;
       spf=pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.181.178 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Received: from wrqvbrbn.outbound-mail.sendgrid.net (wrqvbrbn.outbound-mail.sendgrid.net. [149.72.181.178])
        by gmr-mx.google.com with ESMTPS id f13si784201ybp.0.2021.04.19.09.56.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 09:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net designates 149.72.181.178 as permitted sender) client-ip=149.72.181.178;
Received: by filter2070p1las1.sendgrid.net with SMTP id filter2070p1las1-21436-607DB630-32
        2021-04-19 16:56:16.524226276 +0000 UTC m=+328236.336830125
Received: from MjEyNzE4NTg (unknown)
	by ismtpd0171p1mdw1.sendgrid.net (SG) with HTTP id Z0Xm0HUGSRm87JAyw6RCdA
	Mon, 19 Apr 2021 16:56:16.319 +0000 (UTC)
Content-Type: multipart/alternative; boundary=5c9d63d1b4f208247a2edc9cfed9a0809b3abbb863b83e6d4b4be0b09fa5
Date: Mon, 19 Apr 2021 16:56:19 +0000 (UTC)
From: "Jessa Walter" <jessa.walter@emailsprout.com>
Mime-Version: 1.0
Reply-To: jessa.walter@emailsprout.com
To: jailhouse-dev@googlegroups.com
Message-ID: <Z0Xm0HUGSRm87JAyw6RCdA@ismtpd0171p1mdw1.sendgrid.net>
Subject: Follow up on Aquire Red Hat Users
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mD62c4baaQNINxx
 DrU4+XTQlc6iI4sHN69LTpUGW9klmDjBrK+u2VegEmxnach+77KSjoWuNH83rNLZFOqGGUfqdoYpZ3
 MyK2gXoKu535smDs6q/kmmbiX7bBRm/trymaCzCZ30RKozoqwWvVFvDQWAuePff3nWse1HQufEHslK
 1TrLbYRRmXPDGi6ysVKSjJ
X-SG-ID: mcTyqcYTtmn56LU3ATD1fwbX+4+3Of3TZmHbuKR1xs02NkmmxuGvJW4k4tzlWsCnl+xScwkGVpjUHV
 6Z8/AeDUfX54JDraIj9oF7RVFvQz0lRuDBPBxRKVKEeo0VLqLoLr5ustaMYwKTtNo0dSdgoMUmi+bR
 G2ROcMnp0nGZztlWYgam1KLinV/VA/uV6ldnsLENBHIDcim6x/5yGJ3VIaWGI+AIDFAPpgKVn+2TDk
 qRYP3acFhzWHslfMPeCAqLfkeny24ODV3WxLE6N0ub7wZuLp1xaMb/yzHKRP7+trc3u2SIbeVAqwdq
 MuqCT5DdIB/UXBJdHlAiTUm1QalE7/rc6jodnpWDD3hRGg6b8uTjb9MLNJE8ERDC7fih7i1pyqln5k
 ajbtYjufr0iO9hP3eS3Mm9dy6R2aGc8tNsOv8wI0Ob8uUB2f5wSttHDUovqqMMK32OusGCLvshCujv
 fB6vVrg8L/Z/3s0IIuArM7/u9c5jSth78AhzgH4CfSIy+rgCGIcT81/j/Nsz11UBVvFCqWH5ej6VXc
 sk3akvinoA/f0OpCcMMJsqJPgNqOtS2n6gH1LHm5BGMKuvKsFPDzhKj+y01201j3+sU0bQ+FTG5Mle
 XIqla0pPb+SQYefM2CGvuvQrXdHwwG08oDYoM0iYroitgFXQxK77esngk/fktgT5nSwzLteLFB54gX
 H3
X-Entity-ID: iqBoCwjxWcX3ZhfJcdnXBg==
X-Original-Sender: jessa.walter@emailsprout.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@sendgrid.net header.s=smtpapi header.b=y3J+rele;       spf=pass
 (google.com: domain of bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net
 designates 149.72.181.178 as permitted sender) smtp.mailfrom="bounces+21271858-e85e-jailhouse-dev=googlegroups.com@sendgrid.net"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--5c9d63d1b4f208247a2edc9cfed9a0809b3abbb863b83e6d4b4be0b09fa5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0

Hi,

I am following up with my previous email to of *Red Hat Users data* which c=
an be used for prospecting, qualifying and generating new sales leads to su=
pport the Enterprise Account Managers.

This data will help you to communicate with target audiences and build and =
develop customer relationships and higher revenue for your organization.

Would you like to partner with a Technographics data company like us?

We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.

I will look forward to your response.

Thanks,

Jessa Walter

---------------------------------------------------------------------------=
----------------------------------------------------

Hi,

I have researched on LinkedIn that you are responsible for Sales operations=
 at your company =C2=A0for creating and managing the end-to-end enterprise =
sales process, including leading the implementation of pipeline reporting, =
sales forecasting, and sales analytics.

This data will help your sales team to execute on the account plan to deliv=
er maximum revenue potential, generate new business in new accounts and exp=
and footprint of Red Hat customers.

Would you like to *acquire Red Hat Users* for your sales and marketing team=
s?

We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.

I will look forward to your response.

Thanks,

*Jessa Walter*
Global Lead Generation
Email Sprout, Inc
North America

Jessa Walter

885 Watson Street , Camden , NJ 08102

Unsubscribe ( https://u21271858.ct.sendgrid.net/wf/unsubscribe?upn=3DVU2koN=
EWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-=
2B1Io8-2BjTZz5B0iTMz8-2FLC6lIy3em-2BexngNEbEpkgEZ72DcoX3gT4QslHQpSGlWeLoVOT=
IF69Q69WGU4k-2BVD925D7dGajmOPqa-2BcQbSxFU905uvEc9EkarhJ7JFW4zAcyRMUrWPe24IX=
lxx3pWqK1dJrWrGCHXdHCMYmnSaV2TRAgN8KiYxFQ3mjnN8N45KyKs6-2FOdfdJlikIF2LMCQKo=
LoK4iwYh2A221Q-2BmckP1FLsvNPQUoCQbGKRUXLLL1MKZSJUszl0RIod8fX9FT7s-2FqIdL7b4=
smwTKkl18pGsA2ahKqA4Xr67QOaILnkazMxM-2BxTY2ahUVVoyzFG-2FfwIdmrgVT2vsT9O2BxL=
zyAwfIQWnZy66Z8HIOyxLiszxIYUE-2F3ps6F-2BBBUVrvl3owBVP0B-2BpbQuK8sP4eeCQ2LN6=
JP7tuz94FbQPL-2BjbJ0lL4sjPeLqiosjPwf6gE8CJtmk-2FmkEOlvc0C8vq4aj7jbC-2F1bgXY=
3BTGbc3jRMG125QFShXnvl9g-2Frx5POJc822oU31ptbOAsACi9QCwkSLQeUwFuiEageOMUTUjy=
xcVDZ4rfJ4oL9xervayBOUghkyzR6DVuQI8cBXXlS1sTb3x2k3Gjbc4xSLXVzt4ipW2iRMg50wb=
fAPB3uS35HTw0mgAmhLj-2FFtJ3FFjcaiUxRlM3hBhCTOuFhzR1-2F7NgtXW2RxV3CwIlu6cVAP=
gaEmOlO3wL3WSyN6vg9x44cph5DaVP3GmkOc25d2mRToK-2BBhYXRoN6d2K-2FDRQMu4LM2AYb0=
soOS34M48k7qCLV8DqLbxNmrFRLMMHC5kGwh8qu-2FY6jY3wH7AkKhAkYunbzx4wfVMSINL-2FF=
TubGU2A9dJPM-3D )

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/Z0Xm0HUGSRm87JAyw6RCdA%40ismtpd0171p1mdw1.sendgrid.net.

--5c9d63d1b4f208247a2edc9cfed9a0809b3abbb863b83e6d4b4be0b09fa5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"
Mime-Version: 1.0

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org=
/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html data-editor-version=3D"2" class=3D"sg-campaigns" xmlns=3D"http://www.=
w3.org/1999/xhtml">
    <head>
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
      <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scal=
e=3D1, minimum-scale=3D1, maximum-scale=3D1">
      <!--[if !mso]><!-->
      <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3DEdge">
      <!--<![endif]-->
      <!--[if (gte mso 9)|(IE)]>
      <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
      </xml>
      <![endif]-->
      <!--[if (gte mso 9)|(IE)]>
  <style type=3D"text/css">
    body {width: 600px;margin: 0 auto;}
    table {border-collapse: collapse;}
    table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
    img {-ms-interpolation-mode: bicubic;}
  </style>
<![endif]-->
      <style type=3D"text/css">
    body, p, div {
      font-family: arial,helvetica,sans-serif;
      font-size: 14px;
    }
    body {
      color: #000000;
    }
    body a {
      color: #1188E6;
      text-decoration: none;
    }
    p { margin: 0; padding: 0; }
    table.wrapper {
      width:100% !important;
      table-layout: fixed;
      -webkit-font-smoothing: antialiased;
      -webkit-text-size-adjust: 100%;
      -moz-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }
    img.max-width {
      max-width: 100% !important;
    }
    .column.of-2 {
      width: 50%;
    }
    .column.of-3 {
      width: 33.333%;
    }
    .column.of-4 {
      width: 25%;
    }
    ul ul ul ul  {
      list-style-type: disc !important;
    }
    ol ol {
      list-style-type: lower-roman !important;
    }
    ol ol ol {
      list-style-type: lower-latin !important;
    }
    ol ol ol ol {
      list-style-type: decimal !important;
    }
    @media screen and (max-width:480px) {
      .preheader .rightColumnContent,
      .footer .rightColumnContent {
        text-align: left !important;
      }
      .preheader .rightColumnContent div,
      .preheader .rightColumnContent span,
      .footer .rightColumnContent div,
      .footer .rightColumnContent span {
        text-align: left !important;
      }
      .preheader .rightColumnContent,
      .preheader .leftColumnContent {
        font-size: 80% !important;
        padding: 5px 0;
      }
      table.wrapper-mobile {
        width: 100% !important;
        table-layout: fixed;
      }
      img.max-width {
        height: auto !important;
        max-width: 100% !important;
      }
      a.bulletproof-button {
        display: block !important;
        width: auto !important;
        font-size: 80%;
        padding-left: 0 !important;
        padding-right: 0 !important;
      }
      .columns {
        width: 100% !important;
      }
      .column {
        display: block !important;
        width: 100% !important;
        padding-left: 0 !important;
        padding-right: 0 !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
      }
      .social-icon-column {
        display: inline-block !important;
      }
    }
  </style>
      <!--user entered Head Start--><!--End Head user entered-->
    </head>
    <body>
      <center class=3D"wrapper" data-link-color=3D"#1188E6" data-body-style=
=3D"font-size:14px; font-family:arial,helvetica,sans-serif; color:#000000; =
background-color:#FFFFFF;">
        <div class=3D"webkit">
          <table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"=
100%" class=3D"wrapper" bgcolor=3D"#FFFFFF">
            <tr>
              <td valign=3D"top" bgcolor=3D"#FFFFFF" width=3D"100%">
                <table width=3D"100%" role=3D"content-container" class=3D"o=
uter" align=3D"center" cellpadding=3D"0" cellspacing=3D"0" border=3D"0">
                  <tr>
                    <td width=3D"100%">
                      <table width=3D"100%" cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0">
                        <tr>
                          <td>
                            <!--[if mso]>
    <center>
    <table><tr><td width=3D"600">
  <![endif]-->
                                    <table width=3D"100%" cellpadding=3D"0"=
 cellspacing=3D"0" border=3D"0" style=3D"width:100%; max-width:600px;" alig=
n=3D"center">
                                      <tr>
                                        <td role=3D"modules-container" styl=
e=3D"padding:0px 0px 0px 0px; color:#000000; text-align:left;" bgcolor=3D"#=
FFFFFF" width=3D"100%" align=3D"left"><table class=3D"module preheader preh=
eader-hide" role=3D"module" data-type=3D"preheader" border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"display: none !important;=
 mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height:=
 0; width: 0;">
    <tr>
      <td role=3D"module-content">
        <p></p>
      </td>
    </tr>
  </table><table class=3D"module" role=3D"module" data-type=3D"text" border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" width=3D"100%" style=3D"table-la=
yout: fixed;" data-muid=3D"bf4e0fe6-2ad6-4fd7-9623-060eb5e77187" data-mc-mo=
dule-version=3D"2019-10-22">
    <tbody>
      <tr>
        <td style=3D"padding:18px 0px 18px 0px; line-height:22px; text-alig=
n:inherit;" height=3D"100%" valign=3D"top" bgcolor=3D"" role=3D"module-cont=
ent"><div><div style=3D"font-family: inherit; text-align: inherit">Hi,<br>
<br>
I am following up with my previous email to of<strong> Red Hat Users data</=
strong> which can be used for prospecting, qualifying and generating new sa=
les leads to support the Enterprise Account Managers.<br>
<br>
This data will help you to communicate with target audiences and build and =
develop customer relationships and higher revenue for your organization.<br=
>
<br>
Would you like to partner with a Technographics data company like us?<br>
<br>
We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.<br>
<br>
I will look forward to your response.<br>
<br>
Thanks,</div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit"><span style=3D"color: #000000; font-fam=
ily: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; fon=
t-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; l=
etter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-dec=
oration-thickness: initial; text-decoration-style: initial; text-decoration=
-color: initial; float: none; display: inline">Jessa Walter</span>&nbsp;</d=
iv>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit">---------------------------------------=
---------------------------------------------------------------------------=
-------------</div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit"><br></div>
<div style=3D"font-family: inherit">Hi,<br>
<br>
I have researched on LinkedIn that you are responsible for Sales operations=
 at your company &nbsp;for creating and managing the end-to-end enterprise =
sales process, including leading the implementation of pipeline reporting, =
sales forecasting, and sales analytics.<br>
<br>
This data will help your sales team to execute on the account plan to deliv=
er maximum revenue potential, generate new business in new accounts and exp=
and footprint of Red Hat customers.<br>
<br>
Would you like to <strong>acquire Red Hat Users</strong> for your sales and=
 marketing teams?<br>
<br>
We as a database compiler manage, own, and maintain 80 million business exe=
cutives database worldwide. The unique USP which separates us from the rest=
 is our guarantee of 90% plus email deliverability and contact accuracy whi=
ch is the highest of all data market standards.<br>
<br>
I will look forward to your response.<br>
<br>
Thanks,<br>
<br>
<strong>Jessa Walter</strong><br>
Global Lead Generation<br>
Email Sprout, Inc<br>
North America</div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div>
<div style=3D"font-family: inherit; text-align: inherit"><br></div><div></d=
iv></div></td>
      </tr>
    </tbody>
  </table><div data-role=3D"module-unsubscribe" class=3D"module" role=3D"mo=
dule" data-type=3D"unsubscribe" style=3D"color:#444444; font-size:12px; lin=
e-height:20px; padding:16px 16px 16px 16px; text-align:Center;" data-muid=
=3D"4e838cf3-9892-4a6d-94d6-170e474d21e5"><div class=3D"Unsubscribe--addres=
sLine"><p class=3D"Unsubscribe--senderName" style=3D"font-size:12px; line-h=
eight:20px;">Jessa Walter</p><p style=3D"font-size:12px; line-height:20px;"=
><span class=3D"Unsubscribe--senderAddress">885 Watson Street</span>, <span=
 class=3D"Unsubscribe--senderCity">Camden</span>, <span class=3D"Unsubscrib=
e--senderState">NJ</span> <span class=3D"Unsubscribe--senderZip">08102</spa=
n></p></div><p style=3D"font-size:12px; line-height:20px;"><a class=3D"Unsu=
bscribe--unsubscribeLink" href=3D"https://u21271858.ct.sendgrid.net/wf/unsu=
bscribe?upn=3DVU2koNEWgSKMLPFeqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZE=
aOPsPJfFcqrQhM-2F5O-2B1Io8-2BjTZz5B0iTMz8-2FLC6lIy3em-2BexngNEbEpkgEZ72DcoX=
3gT4QslHQpSGlWeLoVOTIF69Q69WGU4k-2BVD925D7dGajmOPqa-2BcQbSxFU905uvEc9EkarhJ=
7JFW4zAcyRMUrWPe24IXlxx3pWqK1dJrWrGCHXdHCMYmnSaV2TRAgN8KiYxFQ3mjnN8N45KyKs6=
-2FOdfdJlikIF2LMCQKoLoK4iwYh2A221Q-2BmckP1FLsvNPQUoCQbGKRUXLLL1MKZSJUszl0RI=
od8fX9FT7s-2FqIdL7b4smwTKkl18pGsA2ahKqA4Xr67QOaILnkazMxM-2BxTY2ahUVVoyzFG-2=
FfwIdmrgVT2vsT9O2BxLzyAwfIQWnZy66Z8HIOyxLiszxIYUE-2F3ps6F-2BBBUVrvl3owBVP0B=
-2BpbQuK8sP4eeCQ2LN6JP7tuz94FbQPL-2BjbJ0lL4sjPeLqiosjPwf6gE8CJtmk-2FmkEOlvc=
0C8vq4aj7jbC-2F1bgXY3BTGbc3jRMG125QFShXnvl9g-2Frx5POJc822oU31ptbOAsACi9QCwk=
SLQeUwFuiEageOMUTUjyxcVDZ4rfJ4oL9xervayBOUghkyzR6DVuQI8cBXXlS1sTb3x2k3Gjbc4=
xSLXVzt4ipW2iRMg50wbfAPB3uS35HTw0mgAmhLj-2FFtJ3FFjcaiUxRlM3hBhCTOuFhzR1-2F7=
Ngtn520t34k1OKig0jQQcyqCBdG6kmrqPwWfTTdBQ1E-2Ff1hANQYsYes7xLLL2OxFRDhQ-2Bc9=
-2FfKEi5ibY6DZgknvgvFHeQYOOLna2cJ4u-2BE0wBT5o-2FXRxnbD-2FswJjq9RjlAOU1ms4i4=
9yFzfoKpkE0iflUDfIjHjHC6TFiM4Kwg8kEw-3D" target=3D"_blank" style=3D"">Unsub=
scribe</a></p></div></td>
                                      </tr>
                                    </table>
                                    <!--[if mso]>
                                  </td>
                                </tr>
                              </table>
                            </center>
                            <![endif]-->
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </center>
   =20
<img src=3D"https://u21271858.ct.sendgrid.net/wf/open?upn=3DVU2koNEWgSKMLPF=
eqEdbNI9jCap0gyh-2FlSpXi9qCyhTBcX6PA5-2FoCvlZEaOPsPJfFcqrQhM-2F5O-2B1Io8-2B=
jTZz5B0iTMz8-2FLC6lIy3em-2BexngNEbEpkgEZ72DcoX3gT4QslHQpSGlWeLoVOTIF69Q69WG=
U4k-2BVD925D7dGajmOPqa-2BcQbSxFU905uvEc9EkarhJ7JFW4zAcyRMUrWPe24IXlxx3pWqK1=
dJrWrGCHXdHCMYmnSaV2TRAgN8KiYxFQ3mjnN8N45KyKs6-2FOdfdJlikIF2LMCQKoLoK4iwYh2=
A221Q-2BmckP1FLsvNPQUoCQbGKRUXLLL1MKZSJUszl0RIod8fX9FT7s-2FqIdL7b4smwTKkl18=
pGsA2ahKqA4Xr67QOaILnkazMxM-2BxTY2ahUVVoyzFG-2FfwIdmrgVT2vsT9O2BxLzyAwfIQWn=
Zy66Z8HIOyxLiszxIYUE-2F3ps6F-2BBBUVrvl3owBVP0B-2BpbQuK8sP4eeCQ2LN6JP7tuz94F=
bQPL-2BjbJ0lL4sjPeLqiosjPwf6gE8CJtmk-2FmkEOlvc0C8vq4aj7jbC-2F1bgXY3BTGbc3jR=
MG125QFShXnvl9g-2Frx5POJc822oU31ptbOAsACi9QCwkSLQeUwFuiEageOMUTUjyxcVDZ4rfJ=
4oL9xervayBOUghkyzR6DVuQI8cBXXlS1sTb3x2k3Gjbc4xSLXVzt4ipW2iRMg50wbfAPB3uS35=
HTw0mgAmhLj-2FFtJ3FFjcaiUxRlM3hBhCTOuFhzR1-2F7NgtMMn51hum-2FddjeCved-2BNg77=
FeculZ6PNWo4XJnla-2BNKb18qLknpgSHxWrWVnQX-2FGG1XlIIHveQCdl4a00oNQjqKS3PlJ-2=
FzOPVxNDoN6JJdEBIEMMApU-2BHKVX0ACWusTrkWYSP2yc4iqH6Pa4xDENQdhxamlehU-2FIG-2=
B5FiLqFg5Lc-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"hei=
ght:1px !important;width:1px !important;border-width:0 !important;margin-to=
p:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-=
left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padd=
ing-right:0 !important;padding-left:0 !important;"/>
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
om/d/msgid/jailhouse-dev/Z0Xm0HUGSRm87JAyw6RCdA%40ismtpd0171p1mdw1.sendgrid=
.net?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/Z0Xm0HUGSRm87JAyw6RCdA%40ismtpd0171p1mdw1.sendgrid.net</a=
>.<br />

--5c9d63d1b4f208247a2edc9cfed9a0809b3abbb863b83e6d4b4be0b09fa5--
